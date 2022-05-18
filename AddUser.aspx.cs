using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AddUser : System.Web.UI.Page
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

        if (!IsPostBack)
        {
            BindOrganizationType();
            BindOrganization();
        }
    }
    protected void ButtonSubmit_OnClick(object sender, EventArgs e)
    {
        adduser();
    }

    private void adduser()
    {
        int id = 0;
        string q = "select max(cast(userid as int))Id from users";        
        SqlDataReader rd = (SqlDataReader)cm.ExecuteReader(conClass.conn, q, CommandType.Text, null);
        if (rd.Read())
        {
            id = rd.GetInt32(rd.GetOrdinal("Id"));
            id += 1;
        }
        rd.Close();

        string query = @"insert into users (userid,username,userpassword,website,useremail,userphone,userfaxno,usertype,orgtype,orgid)
                        values('" + id + "','" + txtUsername.Text.Trim() + "','" + txtPassword.Text.Trim() + "','" + txtWebsite.Text.Trim() + "','" + txtEmail.Text.Trim() + "','" + txtPhone.Text.Trim() + "','" + txtFax.Text.Trim() + "','" + ddl_usertype.SelectedItem.Value + "','" + ddl_org_type.SelectedItem.Value + "','" + ddl_org.SelectedItem.Value + "')";
        if (ac.Write(query))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = txtUsername.Text.Trim() + " has been registered successfully";
            divtoast.Visible = true;
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = txtUsername.Text.Trim() + " has not registered successfully";
            divtoast.Visible = true;
        }
    }
    protected void BindOrganizationType()
    {
        DataSet ds = cm.GetDataByQuery("select * from organizationtype where id!='2'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_org_type.DataSource = ds;
            ddl_org_type.DataTextField = "name";
            ddl_org_type.DataValueField = "id";
            ddl_org_type.DataBind();
        }
        else
        {
            ddl_org_type.DataBind();
        }
    }
    protected void BindOrganization()
    {
        DataSet ds = cm.GetDataByQuery("select name+','+city as name,id from organization where organizationtype!='2'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_org.DataSource = ds;
            ddl_org.DataTextField = "name";
            ddl_org.DataValueField = "id";
            ddl_org.DataBind();
        }
        else
        {
            ddl_org.DataBind();
        }
    }
}