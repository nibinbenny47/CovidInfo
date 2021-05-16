using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

using System.Web.Configuration;

namespace CovidInfo.Admin
{
    public partial class Pincode : System.Web.UI.Page
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        //SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=db_CovidInfo;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            //con.Open();
        }
       
      

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            //string insQry = "insert into tbl_pincode (pincode_number) values('" + txtPincode.Text + "')";
            //cmd = new SqlCommand(insQry, con);
            //cmd.ExecuteNonQuery();
            //connection();
            con = new SqlConnection(connectionString);
            con.Open();
            cmd = new SqlCommand("sp_Pincode", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@pincode_number", txtPincode.Text);

            cmd.ExecuteNonQuery();
        }





    }
}