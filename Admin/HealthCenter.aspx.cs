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
            cmd = new SqlCommand("sp_HealthCenter", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@status", 1);
            cmd.Parameters.AddWithValue("@healthcenter_name", txtHealthCenter.Text);
            cmd.Parameters.AddWithValue("@healthcenter_password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@healthcenter_availstatus", 1);

            cmd.Parameters.AddWithValue("@pincode_id", ddlPincode.SelectedValue);



            cmd.ExecuteNonQuery();

            txtPassword.Text = "";
            txtHealthCenter.Text = "";
            ddlPincode.ClearSelection();

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
       
    }
}