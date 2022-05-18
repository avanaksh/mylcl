using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class LandingPageAdmin : System.Web.UI.Page
{
    ConnectionClass conClass = new ConnectionClass();
    ActionClass ac = new ActionClass();
    SqlConnection con;
    CommonMethodsL cm = new CommonMethodsL();
    Users user;
    public string instname;
    protected void Page_Load(object sender, EventArgs e)
    {
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


        if (!IsPostBack)
        {
            BindValues();          
        }
    }
    protected void BindValues()
    {
        string query = "select *,(select name from organizationtype where id=organization.organizationtype)organizationtype1 from organization where organizationtype='" + user.organizationtype + "' and id='" + user.organizationid + "'";
        //Response.Write(query);
        DataSet ds = cm.GetDataByQuery(query);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblname.Text = ds.Tables[0].Rows[0]["name"].ToString();
            lbladdress.Text = ds.Tables[0].Rows[0]["address"].ToString();
            lblstate.Text = ds.Tables[0].Rows[0]["state"].ToString();
            lbldistrict.Text = ds.Tables[0].Rows[0]["district"].ToString();
            lblcity.Text = ds.Tables[0].Rows[0]["city"].ToString();
            lblpincode.Text = ds.Tables[0].Rows[0]["pincode"].ToString();
            lblphone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
            lblfax.Text = ds.Tables[0].Rows[0]["fax"].ToString();
            lblemail.Text = ds.Tables[0].Rows[0]["email"].ToString();
            lblwebaddress.Text = ds.Tables[0].Rows[0]["webaddress"].ToString();
            lblnodalcntemail.Text = ds.Tables[0].Rows[0]["nodalemail"].ToString();
            lblsmdname.Text = ds.Tables[0].Rows[0]["smdname"].ToString();
            lbllatitude.Text = ds.Tables[0].Rows[0]["latitude"].ToString();
            lbllongitude.Text = ds.Tables[0].Rows[0]["longitude"].ToString();
            lblshortabrevia.Text = ds.Tables[0].Rows[0]["organisationinshort"].ToString();
            lblorgtype.Text = ds.Tables[0].Rows[0]["organizationtype1"].ToString();

            instname = Convert.ToString(lblshortabrevia.Text) + "," + Convert.ToString(lblcity.Text);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = " Hello, User " + user.username;
            divtoast.Visible = true;
        }
        else
        {
            divtoast.Visible = false;
        }
    }
    protected void ButtonAddUser_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("AddUser.aspx");
    }
}