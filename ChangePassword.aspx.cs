using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ChangePassword : System.Web.UI.Page
{
    ConnectionClass conClass = new ConnectionClass();
    ActionClass ac = new ActionClass();
    SqlConnection con;
    DataSet ds = new DataSet();
    CommonMethodsL cm = new CommonMethodsL();
    Users user;
   protected void Page_Load(object sender, EventArgs e)
    {
        conClass.connect();
        con = new SqlConnection(conClass.conn);
        if (Session["UserObj"] != null)
        {
            user = (Users)Session["UserObj"];
        }
        else
        {
            Response.Redirect("~/CPtoMasterPage1.aspx");
        }

        Label lbluser = (Label)Page.Master.FindControl("lblusername");
        lbluser.Text = user.username;
       
        lbluserid.Text = user.username;
       // lblOldpassword.Text = user.userpassword;
    }

    protected void ButtonSubmit_OnClick(object sender, EventArgs e)
    {
        changepassword();
    }

    protected void changepassword()
    {
        string query = "update users set userpassword='"+txtNewpassword.Text+"' where username='"+lbluserid.Text+"' and userpassword='"+txtOldpassword.Text+"' and usertype='"+user.usertype+"' and orgtype='"+user.organizationtype+"' and orgid='"+user.organizationid+"'";
        if (ac.Write(query))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = user.username +" has changed password successfully";
            divtoast.Visible = true;
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = "<font color='red' style='background:white'>" + user.username + " has not changed password !</font>";
            divtoast.Visible = true;
        }
    }
}