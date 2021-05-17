using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

using System.Web.Configuration;
using System.Configuration;

namespace CovidInfo.Admin
{
    public partial class Pincode : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        public static int id, status = 0;
        //SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=db_CovidInfo;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //con.Open();
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



        protected void btnSave_Click1(object sender, EventArgs e)
        {

            connection();
            if (status == 1)
            {
                cmd = new SqlCommand("sp_Pincode", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", 3);
                cmd.Parameters.AddWithValue("@newpincode_number", txtPincode.Text);
                cmd.Parameters.AddWithValue("@pincode_id", id);


                cmd.ExecuteNonQuery();
                status = 0;

            }
            else
            {
                cmd = new SqlCommand("sp_Pincode", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", 1);
                cmd.Parameters.AddWithValue("@pincode_number", txtPincode.Text);

                cmd.ExecuteNonQuery();


            }
            fillPincode();

        }
        public void fillPincode()
        {
            connection();
            cmd = new SqlCommand("sp_Pincode", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@status", 2);

            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            var reader = cmd.ExecuteReader();
            grdPincode.DataSource = reader;
          
                grdPincode.DataBind();
              
            }









        //SqlDataAdapter adp = new SqlDataAdapter(cmd);
        //var reader = cmd.ExecuteReader();
        //grdPincode.DataSource = reader;
        //grdPincode.DataBind();
        //grdPincode.UseAccessibleHeader = true;
        //grdPincode.HeaderRow.TableSection = TableRowSection.TableHeader;
        //-----for jQuery datatable ------------



        //-----check pincode availability-----------
        public static int CheckPincode(string pincode)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            SqlConnection con = new SqlConnection(connectionString);
             con.Open();
            //string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            //using (SqlConnection conn = new SqlConnection(constr))
            //{

            using (SqlCommand cmd = new SqlCommand("sp_Pincode", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@status", 6);
                    cmd.Parameters.AddWithValue("@pincode_number", pincode);
                    con.Open();
                    return (int)cmd.ExecuteScalar();
                   
                }
            }
            
        
          
        





    protected void grdPincode_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            id = Convert.ToInt32(e.CommandArgument.ToString());
            connection();
            if (e.CommandName == "del")
            {

                cmd = new SqlCommand("sp_Pincode", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", 4);
                cmd.Parameters.AddWithValue("@pincode_id", id);
                cmd.ExecuteNonQuery();
                fillPincode();

            }
            if (e.CommandName == "ed")
            {
                cmd = new SqlCommand("sp_Pincode", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@status", 5);
                cmd.Parameters.AddWithValue("@pincode_id", id);

                DataTable dt = new DataTable();
                SqlDataAdapter adp = new SqlDataAdapter(cmd);
                adp.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    txtPincode.Text = dt.Rows[0]["pincode_number"].ToString();
                    status = 1;
                }
            }
        }
       
    }
}