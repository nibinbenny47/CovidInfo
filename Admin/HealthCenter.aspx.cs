using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Configuration;

namespace CovidInfo.Admin
{
    public partial class HealthCenter : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        public static int id, status = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillPincode();
                fillGridHealthCenter();
            }
        }
        public void connection()
        {
            con = new SqlConnection(connectionString);
            con.Open();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            connection();

            //-----update-----
            if (status == 1)
            {

                cmd = new SqlCommand("sp_HealthCenter", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", 4);
                cmd.Parameters.AddWithValue("@newhealthcenter_name", txtHealthCenter.Text);
                cmd.Parameters.AddWithValue("@newpincode_id", ddlPincode.SelectedValue);
                cmd.Parameters.AddWithValue("@newhealthcenter_availstatus", rdbStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@healthcenter_id", id);
                cmd.ExecuteNonQuery();
                status = 0;

            }
            //----insert------------
            else
            {
                cmd = new SqlCommand("sp_HealthCenter", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", 1);
                cmd.Parameters.AddWithValue("@healthcenter_name", txtHealthCenter.Text);
                cmd.Parameters.AddWithValue("@healthcenter_availstatus", rdbStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@pincode_id", ddlPincode.SelectedValue);
                cmd.ExecuteNonQuery();

            }
            //txtPassword.Text = "";
            txtHealthCenter.Text = "";
            rdbStatus.ClearSelection();
            ddlPincode.ClearSelection();
            fillGridHealthCenter();
        }
        //---fill pincode dropdown----
        protected void fillPincode()
        {
            connection();
            cmd = new SqlCommand("sp_HealthCenter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@status", 3);

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adp.Fill(dt);
            ddlPincode.DataSource = dt;
            ddlPincode.DataTextField = "pincode_number";
            ddlPincode.DataValueField = "pincode_id";
            ddlPincode.DataBind();
            ddlPincode.Items.Insert(0, "--select--");
        }
        protected void grdHealthCenter_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label active = ((Label)e.Row.FindControl("lblActive"));
                Label Inactive = ((Label)e.Row.FindControl("lblInActive"));
                HiddenField hdn = ((HiddenField)e.Row.FindControl("hdnStatus"));
                if (hdn.Value == "1")
                {
                    active.Visible = true;
                    active.CssClass = "active";
                }
                else
                {
                    Inactive.Visible = true;
                    Inactive.CssClass = "inactive";
                }
            }
        }

        protected void grdHealthCenter_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            id = Convert.ToInt32(e.CommandArgument.ToString());
            connection();
            if (e.CommandName == "del")
            {

                cmd = new SqlCommand("sp_delete", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@tablename", "tbl_healthcenter");
                cmd.Parameters.AddWithValue("@condition", "healthcenter_id");
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.ExecuteNonQuery();
                fillGridHealthCenter();

            }
            if (e.CommandName == "ed")
            {
                cmd = new SqlCommand("sp_selectById", con);
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@status", 2);
                cmd.Parameters.AddWithValue("@table1", "tbl_healthcenter");
                cmd.Parameters.AddWithValue("@table2", "tbl_pincode");
                cmd.Parameters.AddWithValue("@table1short", "h");
                cmd.Parameters.AddWithValue("@table2short", "p");
                cmd.Parameters.AddWithValue("@fieldset", "*");
                cmd.Parameters.AddWithValue("@field", "pincode_id");
                cmd.Parameters.AddWithValue("@condition", "healthcenter_id");
                cmd.Parameters.AddWithValue("@Id", id);
                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    txtHealthCenter.Text = dt.Rows[0]["healthcenter_name"].ToString();
                    ddlPincode.SelectedValue = dt.Rows[0]["pincode_id"].ToString();
                    rdbStatus.SelectedValue = dt.Rows[0]["healthcenter_availstatus"].ToString();
                    status = 1;
                }
            }
        }

        //----fill jQuery datatable ---------
        public void fillGridHealthCenter()
        {
            connection();
            cmd = new SqlCommand("sp_innerjoin", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@fieldset", "*");
            cmd.Parameters.AddWithValue("@table1", "tbl_healthcenter");
            cmd.Parameters.AddWithValue("@table2", "tbl_pincode");
            cmd.Parameters.AddWithValue("@table1Short", "h");
            cmd.Parameters.AddWithValue("@table2Short", "p");
            cmd.Parameters.AddWithValue("@equalCondition", "pincode_id");
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            var reader = cmd.ExecuteReader();
            grdHealthCenter.DataSource = reader;
            grdHealthCenter.DataBind();
            grdHealthCenter.UseAccessibleHeader = true;
            grdHealthCenter.HeaderRow.TableSection = TableRowSection.TableHeader;

        }

    }
}