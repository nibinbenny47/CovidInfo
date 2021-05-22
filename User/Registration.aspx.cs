using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
//Using namespaces  
using System.Web.Configuration;
using System.Configuration;
using System.Text;
using System.Net;
using System.Net.Mail;

namespace CovidInfo.User
{
    public partial class Registration : System.Web.UI.Page
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

       
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            connection();
            cmd = new SqlCommand("sp_Insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@status", 1);
            //cmd.Parameters.AddWithValue("@table","tbl_user" );
            cmd.Parameters.AddWithValue("@user_name", txtName.Text);
            cmd.Parameters.AddWithValue("@user_gender", rdbGender.SelectedValue);
            cmd.Parameters.AddWithValue("@user_email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@user_dob", txtDOB.Text);
            cmd.Parameters.AddWithValue("@user_aadhar",txtAdhaar.Text );
            cmd.Parameters.AddWithValue("@healthcenter_id",ddlHealthCenter.SelectedValue );
            cmd.Parameters.AddWithValue("@date",txtvaccineDate.Text);
           
            cmd.ExecuteNonQuery();
            

        }
        //-----dose 1 checking--------
        protected void btnCheckAadhar_Click(object sender, EventArgs e)
        {
            connection();
            string selQry = "select * from tbl_user where user_aadhar ='"+txtAdhaar.Text+"'";
            SqlDataAdapter adp = new SqlDataAdapter(selQry,con);

            DataTable dt = new DataTable();
            adp.Fill(dt);
            if(dt.Rows.Count == 0)
            {
                Response.Write("<script>alert('success')</script>");
            }
            else
            {
                Response.Write("<script>alert('errror')</script>");


            }
        }
       

        
        //---dose2 checking------------------
        protected void btnCheckAdhar2_Click(object sender, EventArgs e)
        {
            connection();
            string selQry = "select * from tbl_user where user_aadhar ='" + txtAadhar2.Text + "'";
            SqlDataAdapter adp = new SqlDataAdapter(selQry, con);

            DataTable dt = new DataTable();
            adp.Fill(dt);
            if (dt.Rows.Count >0)
            {
                DateTime enddate = DateTime.Now;


               
                DateTime startdate = (DateTime)dt.Rows[0]["date"];
                TimeSpan difference =  startdate - enddate;
                int days = Convert.ToInt32(difference.TotalDays);
                //txtEmail2.Text = days.ToString();
                if (days > 2)
                {
                    Response.Write("<script>alert('"+ days + "')</script>");

                }
                else
                {
                    Response.Write("<script>alert('date')</script>");

                }
            }
            else
            {
                Response.Write("<script>alert('You are not registered for Dose 1')</script>");


            }
          
        }

        protected void ddlPincode_SelectedIndexChanged(object sender, EventArgs e)
        {
            connection();
            cmd = new SqlCommand("sp_select", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@table", "tbl_healthcenter");
            cmd.Parameters.AddWithValue("@fieldset", "*");
            cmd.Parameters.AddWithValue("@Id", "pincode_id");
            cmd.Parameters.AddWithValue("@Idvalue", ddlPincode.SelectedValue);
            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(dt);
            ddlHealthCenter.DataSource = dt;
            ddlHealthCenter.DataTextField = "healthcenter_name";
            ddlHealthCenter.DataValueField = "healthcenter_id";
            ddlHealthCenter.DataBind();
            ddlHealthCenter.Items.Insert(0, "--select--");
        }
    }
}