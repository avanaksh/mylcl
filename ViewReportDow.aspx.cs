using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ViewReportDow : System.Web.UI.Page
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
            BindSmd();
        }
    }
    private void BindSmd()
    {
        DataSet ds = cm.GetDataByQuery("select distinct smdname from organization");
        ddl_smd_name.Items.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_smd_name.DataSource = ds;
            ddl_smd_name.DataTextField = "smdname";
            ddl_smd_name.DataValueField = "smdname";
            ddl_smd_name.DataBind();
        }
        else
        {
            ddl_smd_name.DataBind();
        }
    }
    private void BindInstitute(string smdnam)
    {
        DataSet ds = cm.GetDataByQuery("select name+ ' ' + CASE WHEN organizationtype = '2' THEN 'RS' ELSE district END + ',' + city AS name,id from organization where organizationtype not in ('2') and smdname='" + smdnam + "'  order by name");
        ddl_institute.Items.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_institute.DataSource = ds;
            ddl_institute.DataTextField = "name";
            ddl_institute.DataValueField = "id";
            ddl_institute.DataBind();
        }
        else
        {
            ddl_institute.DataBind();
        }
    }

    private void BindRegionalStation(string inst)
    {
        DataSet ds = cm.GetDataByQuery("select name+ ' ' + CASE WHEN organizationtype = '2' THEN 'RS' ELSE district END + ',' + city AS name,id from organization where organizationtype ='" + inst + "' or organizationsubtype='" + inst + "'  order by name");
        ddl_regional_station.Items.Clear();
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_regional_station.DataSource = ds;
            ddl_regional_station.DataTextField = "name";
            ddl_regional_station.DataValueField = "id";
            ddl_regional_station.DataBind();
        }
        else
        {
           ddl_regional_station.DataBind();
        }
    }
    protected void ButtonSubmit_OnClick(object sender, EventArgs e)
    {       
        BindGridView();
        if (GridView1.Rows.Count > 0)
        {
            divgridreport.Visible = true;
            divtoast.Visible = false;
            lblmsg.Visible = false;
        }
        else
        {
            divgridreport.Visible = false;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = "No Records";
            divtoast.Visible = true;
        }
    }
    protected void BindGridView()
    {
        DataSet ds = cm.GetDataByQuery("select *,name+ ' ' + CASE WHEN organizationtype = '2' THEN 'RS' ELSE district END + ',' + city AS name1,(convert(varchar,entrydate,103))as entrydate1 from qryLandRecordms where orgid='" + ddl_institute.SelectedItem.Value + "' or organizationsubtype='" + ddl_institute.SelectedItem.Value + "'");
        
        if (ds.Tables[0].Rows.Count > 0)
        {
            GridView1.DataSource = ds;
            GridView1.DataBind();
            divtoast.Visible = false;
        }
        else
        {
            GridView1.DataBind();
        }
    }
    protected void ddl_smd_name_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_smd_name.SelectedItem.Value != "-1")
        {
            ddl_institute.Items.Clear();
            BindInstitute(ddl_smd_name.SelectedItem.Value);
            ddl_regional_station.Items.Clear();
            divtoast.Visible = false;
        }
        else
        {
            BindInstitute("-1");
            ddl_institute.Enabled = false;
            divtoast.Visible = false;
        }
    }
    protected void ddl_institute_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_institute.SelectedItem.Value != "-1")
        {
            BindRegionalStation(ddl_institute.SelectedItem.Value);
            divtoast.Visible = false;
        }
        else
        {
            BindRegionalStation("-1");
            divtoast.Visible = false;
        }
    }
}