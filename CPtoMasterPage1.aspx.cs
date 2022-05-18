using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mail;

public partial class CPtoMasterPage1 : System.Web.UI.Page
{
    ConnectionClass conClass = new ConnectionClass();
    ActionClass ac = new ActionClass();
    SqlConnection con;
    CommonMethodsL cm = new CommonMethodsL();

    List<SqlParameter> lst = new List<SqlParameter>();
    protected void Page_Load(object sender, EventArgs e)
    {
        conClass.connect();
        con = new SqlConnection(conClass.conn);



        if (!IsPostBack)
        {
            Bind();
            //Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#myModalSave').modal('show')", false);
        }
    }

    private void Bind()
    {
        DataSet ds = cm.GetDataByQuery("select * from landholdingicar");
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        else
        {
            GridView1.DataBind();
        }
    }

    protected void ButtonSignIn_OnClick(object sender, EventArgs e)
    {
        login();
    }

    protected void login()
    {
        if (txtUsername.Text != string.Empty && txtPassword.Text != string.Empty)
        {
            lst.Clear();

            lst.Add(new SqlParameter("@2", txtUsername.Text.Trim()));
            lst.Add(new SqlParameter("@7", txtPassword.Text.Trim()));

            string query = "select * from users where username=@2 and userpassword=@7";

            SqlDataReader rd = cm.ExecuteReader(conClass.conn, query, CommandType.Text, lst.ToArray());

            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    Users user = new Users();
                    user.userid = rd["userid"].ToString();
                    user.username = rd["username"].ToString();
                    user.userpassword = rd["userpassword"].ToString();
                    user.usertype = rd["usertype"].ToString();
                    user.organizationtype = rd["orgtype"].ToString();
                    user.organizationid = rd["orgid"].ToString();

                    if (user != null)
                        Session["UserObj"] = user;

                    if (user.usertype == "1")
                        Response.Redirect("LandingPage.aspx");
                    else if (user.usertype == "2")
                        Response.Redirect("LandingPageAdmin.aspx");
                    else if (user.usertype == "3")
                        Response.Redirect("LandingPageDow.aspx");
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
                lblmsg.Text = "Username and password not found";
                divtoast.Visible = true;
            }
            rd.Close();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = "Either username or passsword is incorrect";
            divtoast.Visible = true;
        }

    }

    protected void ButtonSubmitfpwd_Click(object sender, EventArgs e)
    {
        forgotpassword();
    }
    protected void forgotpassword()
    {
        string query = "select username, userpassword from Users where useremail=@usremail";

        lst.Clear();
        lst.Add(new SqlParameter("@usremail", txtEmailIdfpwd.Text.Trim()));

        SqlDataReader sdr = cm.ExecuteReader(conClass.conn, query, CommandType.Text, lst.ToArray());

        if (sdr.Read())
        {

            string varUserId = sdr.GetString(0);
            string varUserPass = sdr.GetString(1);

            MailMessage msgMail = new MailMessage();
            msgMail.To = txtEmailIdfpwd.Text.Trim();
            msgMail.From = "ams.ivri@icar.gov.in";
            msgMail.Subject = "Your account details";
            msgMail.BodyFormat = MailFormat.Text;
            msgMail.Body = "User Name: " + varUserId + "\nPassword: " + varUserPass;
            SmtpMail.SmtpServer = "172.16.1.1";
            SmtpMail.Send(msgMail);

            txtEmailIdfpwd.Text = "";

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#myModalSave').modal('show')", true);
            //Image10.ImageUrl = "http://www.pngmart.com/files/3/Green-Tick-PNG-Pic.png";
            //lblmodalmessage.Text = "Your User name and Password has sent successfully to your emailid.";
            //lblmodalmessage.Visible = true;

            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = "<h4>Your User name and Password has sent successfully to your email.</h4>";
            divtoast.Visible = true;

        }
        else
        {

            txtEmailIdfpwd.Text = "";

            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = "<h6>The email you have entered does not exist.</h6>";
            divtoast.Visible = true;

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#myModalSave').modal('show')", true);
            //Image10.ImageUrl = "https://p7.hiclipart.com/preview/72/984/35/computer-icons-weather-warning-iconfinder-clip-art-alert-icon-free-icons.jpg";
            //lblmodalmessage.Text = "The emailid you have entered does not exist.";
            //lblmodalmessage.Visible = true;

        }

    }
}