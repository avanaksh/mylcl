using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ViewLandReport : System.Web.UI.Page
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
            BindInstitute();            
        }

    }
    protected void BindGridView()
    {
        DataSet ds = cm.GetDataByQuery("select *,name+ ' ' + CASE WHEN organizationtype = '2' THEN 'RS' ELSE district END + ',' + city AS name1,(convert(varchar,entrydate,103))as entrydate1 from qryLandRecordms where landrecorduserid='" + user.userid + "' and organizationid='" + ddl_institute.SelectedItem.Value + "' or organizationsubtype='" + ddl_institute.SelectedItem.Value + "'");
       
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

    private void BindInstitute()
    {
        DataSet ds = cm.GetDataByQuery("select name+ ' ' + CASE WHEN organizationtype = '2' THEN 'RS' ELSE district END + ',' + city AS name,id from organization where id='" + user.organizationid + "' or organizationsubtype='" + user.organizationid + "'");
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

    private void BindState()
    {
        DataSet ds = cm.GetDataByQuery("select stateid,districtid,statedistrictname from LandRecordStateDistrict where districtid='0' and type='state'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_state.DataSource = ds;
            ddl_state.DataTextField = "statedistrictname";
            ddl_state.DataValueField = "stateid";
            ddl_state.DataBind();
        }
        else
        {
            ddl_state.DataBind();
        }
    }

    private void BindDistrict(string nstateid)
    {
        DataSet ds = cm.GetDataByQuery("select stateid,districtid,statedistrictname from LandRecordStateDistrict where stateid='" + nstateid + "' and type='district'");
        ddl_district.Items.Clear();
        ddl_district.Items.Add(new ListItem("Please Select", "-1"));
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_district.DataSource = ds;
            ddl_district.DataTextField = "statedistrictname";
            ddl_district.DataValueField = "districtid";
            ddl_district.DataBind();
        }
        else
        {
            ddl_district.DataBind();
        }


    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {

        BindGridView();
        if (GridView1.Rows.Count > 0)
        {
            divreport.Visible = true;
            divtoast.Visible = false;
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = "No Records";
            divtoast.Visible = true;
        }
    }
    protected void ddl_state_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_state.SelectedItem.Value != "-1")
        {
            BindDistrict(ddl_state.SelectedItem.Value);
        }
        else
        {

        }
    }
}