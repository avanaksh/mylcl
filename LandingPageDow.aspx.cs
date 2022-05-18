using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class LandingPageDow : System.Web.UI.Page
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
        
        if(!IsPostBack){
            BindValues();
            BindOrganizationType();
        }
    }
    protected void BindValues()
    {
        string query = "select *,(select name from organizationtype where id=organization.organizationtype)organizationtype1 from organization where organizationtype='" + user.organizationtype + "' and id='"+user.organizationid+"'";
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

            //Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            //lblmsg.Text = " Hello, User " + user.username;
            divtoast.Visible = false;
        }
        else
        {
            divtoast.Visible = false;
        }
    }
    protected void BindValuesEdit()
    {
        string query = "select *,(select name from organizationtype where id=organization.organizationtype)organizationtype1 from organization where organizationtype='" + user.organizationtype + "' and id='" + user.organizationid + "'";
        //Response.Write(query);
        DataSet ds = cm.GetDataByQuery(query);
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtName.Text = ds.Tables[0].Rows[0]["name"].ToString();
            txtAddress.Text = ds.Tables[0].Rows[0]["address"].ToString();
            txtState.Text = ds.Tables[0].Rows[0]["state"].ToString();
            txtDistrict.Text = ds.Tables[0].Rows[0]["district"].ToString();
            txtCity.Text = ds.Tables[0].Rows[0]["city"].ToString();
            txtPincode.Text = ds.Tables[0].Rows[0]["pincode"].ToString();
            txtPhone.Text = ds.Tables[0].Rows[0]["phone"].ToString();
            txtFax.Text = ds.Tables[0].Rows[0]["fax"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["email"].ToString();
            txtWebaddress.Text = ds.Tables[0].Rows[0]["webaddress"].ToString();
            txtNodalcntemail.Text = ds.Tables[0].Rows[0]["nodalemail"].ToString();
            txtSmdname.Text = ds.Tables[0].Rows[0]["smdname"].ToString();
            txtLatitude.Text = ds.Tables[0].Rows[0]["latitude"].ToString();
            txtLongitude.Text = ds.Tables[0].Rows[0]["longitude"].ToString();
            txtShortabrevia.Text = ds.Tables[0].Rows[0]["organisationinshort"].ToString();
            ddlOrgtype.SelectedValue = ds.Tables[0].Rows[0]["organizationtype"].ToString();

            divtoast.Visible = false;
        }
        else
        {
            divtoast.Visible = false;
        }
    }
    protected void BindOrganizationType()
    {
        DataSet ds = cm.GetDataByQuery("select * from organizationtype where id not in ('2')");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddlOrgtype.DataSource = ds;
            ddlOrgtype.DataTextField = "name";
            ddlOrgtype.DataValueField = "id";
            ddlOrgtype.DataBind();
        }
        else
        {
            ddlOrgtype.DataBind();
        }
    }
    protected void ButtonEditUpdate_OnClick(object sender, EventArgs e)
    {
        BindValuesEdit();

        Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#exampleModalScrollable').modal('show');", true);
       
    }
    protected void LinkButtonSave_OnClick(object sender, EventArgs e)
    {
        string query = "update organization set nodalemail='" + txtNodalcntemail.Text.Trim() + "' where id='" + user.organizationid + "'";

        if (ac.Write(query))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text =  user.username + " details updated successfully";
            divtoast.Visible = true;
            Response.Redirect("LandingPage.aspx");
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = user.username + " details not updated !";
            divtoast.Visible = true;
        }

    }
    protected void ButtonFillForm_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("ProformaofLandRecord.aspx");
    }
    protected void ButtonViewForm_OnClick(object sender, EventArgs e)
    {
        Response.Redirect("ViewLandReport.aspx");
    }
}