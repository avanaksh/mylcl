using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Globalization;

public partial class ProformaofLandRecord : System.Web.UI.Page
{
    ConnectionClass conClass = new ConnectionClass();
    ActionClass ac = new ActionClass();
    SqlConnection con;
    DataSet ds = new DataSet();
    CommonMethodsL cm = new CommonMethodsL();
    Users user;


    public class LandRecord
    {
       // public string LR_name_of_institute { get; set; }
       // public string LR_state { get; set; }
        //public string LR_district { get; set; }
        //public string LR_latitude { get; set; }
       // public string LR_longitude { get; set; }
        public string LR_height_from_msl { get; set; }
        public string LR_total_land_area_in_hectare { get; set; }
        public string LR_LandUtiliz_details_in_hectare { get; set; }
        public string LR_LandUtiliz_farmarea_researcharea { get; set; }
        public string LR_LandUtiliz_area_under_buildings { get; set; }
        public string LR_LandUtiliz_area_under_sportgrounds_park_or_green { get; set; }
        public string LR_LandUtiliz_forest_area { get; set; }
        public string LR_LandUtiliz_areanotutilized_vacantland { get; set; }
        public string LR_owner_desc_asper_revenue_record { get; set; }
        public string LR_possession_asper_revenue_record { get; set; }
        public string LR_date_of_acquistion { get; set; }
        public string LR_whether_landhold_free_or_lease { get; set; }
        public string LR_whether_title_favaour_of_icar_or_not { get; set; }
        public string LR_whether_freefrom_enchroachmnt_or_litigation { get; set; }
        public string LR_whether_freefrom_enchroachmnt_or_litigation_ifnotdetails { get; set; }
        public string LR_lease_leaseperiod { get; set; }
        public string LR_lease_start_of_lease { get; set; }
        public string LR_lease_renewal_of_lease { get; set; }
        public string LR_whether_institute_leased_land_orgn_or_not { get; set; }
        public string LR_institute_leased_land_area_in_hect { get; set; }
        public string LR_institute_leased_land_lease_period { get; set; }
        public string LR_whether_any_disputes_or_court_cases { get; set; }
        public string LR_status_of_disputes_or_court_cases { get; set; }
        public string LR_date_of_disputes_or_court_cases { get; set; }
        public string LR_incase_sg_seeking_return_of_land { get; set; }
        public string LR_brief_note_proposal_status_submittedto_sg { get; set; }
        public string LR_any_other_information { get; set; }
    }



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

        divorwupload.Visible = true;
        if (!IsPostBack)
        {
            // semesterrunningstatus();
            // BindLabelValues();
            // BindGridViewMemberType();           
            // BindLabelValuesForApproved();
            BindInstitute();
            BindState();
            BindDistrict();
            BindValues();
        }


    }

    protected void BindValues()
    {
        string query = "select name,id,address,state,district,longitude,latitude from organization where id='" + user.organizationid + "' and organizationtype='" + user.organizationtype + "'";
        //  Response.Write(query);
        DataSet ds = cm.GetDataByQuery(query);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_institute.SelectedItem.Value = ds.Tables[0].Rows[0]["id"].ToString();
            ddl_state.SelectedValue = ds.Tables[0].Rows[0]["state"].ToString();
            ddl_district.SelectedValue = ds.Tables[0].Rows[0]["district"].ToString();
            txt_address.Text = ds.Tables[0].Rows[0]["address"].ToString();
            txt_latitude.Text = ds.Tables[0].Rows[0]["latitude"].ToString();
            txt_longitude.Text = ds.Tables[0].Rows[0]["longitude"].ToString();
        }
        else
        {

        }
    }

    protected void BindValues(string nid)
    {
        string query = "select name,id,address,state,district,longitude,latitude from organization where id='" + nid + "'";
        //Response.Write(query);
        DataSet ds = cm.GetDataByQuery(query);
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_state.SelectedValue = ds.Tables[0].Rows[0]["state"].ToString();
            ddl_district.SelectedValue = ds.Tables[0].Rows[0]["district"].ToString();
            txt_address.Text = ds.Tables[0].Rows[0]["address"].ToString();
            txt_latitude.Text = ds.Tables[0].Rows[0]["latitude"].ToString();
            txt_longitude.Text = ds.Tables[0].Rows[0]["longitude"].ToString();
        }
        else
        {

        }
    }

    private void BindInstitute()
    {
        DataSet ds = cm.GetDataByQuery("select name+ ' ' + CASE WHEN organizationtype = '2' THEN 'RS' ELSE district END + ',' + city AS name,id from organization where id='" + user.organizationid + "' or organizationsubtype='" + user.organizationid + "'");
        //Response.Write("select name+ ' ' + CASE WHEN organizationtype = '2' THEN 'RS' ELSE district END + ',' + city AS name,id from organization where id='" + user.organizationid + "' or organizationsubtype='" + user.organizationid + "'");
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
    {//"select stateid,districtid,statedistrictname from LandRecordStateDistrict where districtid='0' and type='state'"
        DataSet ds = cm.GetDataByQuery("select distinct state from organization");
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_state.DataSource = ds;
            ddl_state.DataTextField = "state";
            ddl_state.DataValueField = "state";
            ddl_state.DataBind();
        }
        else
        {
            ddl_state.DataBind();
        }
    }

    //private void BindDistrict(string nstateid)
    private void BindDistrict()
    {//"select stateid,districtid,statedistrictname from LandRecordStateDistrict where  type='district'"
        DataSet ds = cm.GetDataByQuery("select distinct district from organization");
        ddl_district.Items.Clear();
        ddl_district.Items.Add(new ListItem("Please Select", "-1"));
        if (ds.Tables[0].Rows.Count > 0)
        {
            ddl_district.DataSource = ds;
            ddl_district.DataTextField = "district";
            ddl_district.DataValueField = "district";
            ddl_district.DataBind();
        }
        else
        {
            ddl_district.DataBind();
        }


    }


    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
        save();
    }
    protected void save()
    {
        DateTime? dt1 = null, dt2 = null, dt3 = null, dt4 = null, dt5 = null;

        LandRecord lr = new LandRecord();

        // lr.LR_name_of_institute = ddl_institute.SelectedItem.Value;
        // lr.LR_state = ddl_state.SelectedItem.Value;
        // lr.LR_district = ddl_district.SelectedItem.Value;
        // lr.LR_latitude = txt_latitude.Text;
        //lr.LR_longitude = txt_longitude.Text;
        lr.LR_height_from_msl = txt_height_from_msl.Text;
        lr.LR_total_land_area_in_hectare = txt_total_land_area_hectare.Text;
        lr.LR_LandUtiliz_details_in_hectare = txt_landutilization_details_in_hectare.Text;
        lr.LR_LandUtiliz_farmarea_researcharea = txt_farm_or_research_area.Text;
        lr.LR_LandUtiliz_area_under_buildings = txt_area_under_buildings.Text;
        lr.LR_LandUtiliz_area_under_sportgrounds_park_or_green = txt_area_under_sportsparkgreenarea.Text;
        lr.LR_LandUtiliz_areanotutilized_vacantland = txt_area_notutilized_vacantland.Text;
        lr.LR_owner_desc_asper_revenue_record = txt_ownership_desc_asper_revenue_record.Text;
        //lr.LR_possession_asper_revenue_record = txt_possession_asper_revenue_record.Text;
        dt3 = DateTime.Parse(txt_possession_asper_revenue_record.Text, CultureInfo.CreateSpecificCulture("en-US"));
        lr.LR_possession_asper_revenue_record = Convert.ToString(dt3);
        dt4 = DateTime.Parse(txt_date_of_acquistion.Text, CultureInfo.CreateSpecificCulture("en-US"));
        lr.LR_date_of_acquistion = Convert.ToString(dt4);
        lr.LR_whether_landhold_free_or_lease = ddl_land_type.SelectedItem.Value;
        lr.LR_whether_title_favaour_of_icar_or_not = ddl_whether_title_infavour_of_icar_ornot.SelectedItem.Value;
        //lr.LR_whether_freefrom_enchroachmnt_or_litigation = ddl_whether_freefrom_encroachment_litigation.SelectedItem.Value;
        if (ddl_whether_freefrom_encroachment_litigation.SelectedItem.Value != "-1")
        {
            if (ddl_whether_freefrom_encroachment_litigation.SelectedItem.Value == "no")
            {
                lr.LR_whether_freefrom_enchroachmnt_or_litigation_ifnotdetails = txt_whether_freefrom_encroachment_litigation.Text;
            }
            else
            {
                lr.LR_whether_freefrom_enchroachmnt_or_litigation = ddl_whether_freefrom_encroachment_litigation.SelectedItem.Value;
            }
        }
        lr.LR_lease_leaseperiod = txt_lease_period.Text;
        dt1 = DateTime.Parse(txt_startdate_of_lease.Text, CultureInfo.CreateSpecificCulture("en-US"));
        lr.LR_lease_start_of_lease = Convert.ToString(dt1);
        dt2 = DateTime.Parse(txt_renewaldate_of_lease.Text, CultureInfo.CreateSpecificCulture("en-US"));
        lr.LR_lease_renewal_of_lease = Convert.ToString(dt2);
        if (ddl_whether_inst_leased_land_or_not.SelectedItem.Value != "-1")
        {
            if (ddl_whether_inst_leased_land_or_not.SelectedItem.Value == "no")
            {
                lr.LR_whether_institute_leased_land_orgn_or_not = ddl_whether_inst_leased_land_or_not.SelectedItem.Value;
            }
            else
            {
                lr.LR_whether_institute_leased_land_orgn_or_not = ddl_whether_inst_leased_land_or_not.SelectedItem.Value;
                lr.LR_institute_leased_land_area_in_hect = txt_area_in_hectares.Text;
                lr.LR_institute_leased_land_lease_period = txt_lease_period.Text;
            }
        }
        if (ddl_whether_anydispute_or_course_cases.SelectedItem.Value != "-1")
        {
            if (ddl_whether_anydispute_or_course_cases.SelectedItem.Value == "yes")
            {
                lr.LR_whether_any_disputes_or_court_cases = ddl_whether_anydispute_or_course_cases.SelectedItem.Value;
                lr.LR_status_of_disputes_or_court_cases = txt_status_of_disputes_court_cases.Text;
                dt5 = DateTime.Parse(txt_date_of_disputes_court_cases.Text, CultureInfo.CreateSpecificCulture("en-US"));
                lr.LR_date_of_disputes_or_court_cases = Convert.ToString(dt5);
            }
            else
            {
                lr.LR_whether_freefrom_enchroachmnt_or_litigation = ddl_whether_anydispute_or_course_cases.SelectedItem.Value;
            }
        }

        lr.LR_incase_sg_seeking_return_of_land = txt_sg_seeking_return_of_land.Text;
        lr.LR_brief_note_proposal_status_submittedto_sg = txt_brief_note_status_of_proposal_submitted_sg.Text;
        lr.LR_any_other_information = txt_any_other_info.Text;



        string whether_freefrom_encroachment_litigation = "";
        string whether_freefrom_encroachment_litigationnotdetails = "";

        if (ddl_whether_freefrom_encroachment_litigation.SelectedItem.Value != "-1")
        {
            if (ddl_whether_freefrom_encroachment_litigation.SelectedItem.Value == "no")
            {
                //new SqlParameter("@whether_title_favaour_of_icar_or_not", Convert.ToString(lr.LR_whether_freefrom_enchroachmnt_or_litigation_ifnotdetails));
                lr.LR_whether_freefrom_enchroachmnt_or_litigation_ifnotdetails = txt_whether_freefrom_encroachment_litigation.Text;
                whether_freefrom_encroachment_litigationnotdetails = lr.LR_whether_freefrom_enchroachmnt_or_litigation_ifnotdetails;
                whether_freefrom_encroachment_litigation = ddl_whether_freefrom_encroachment_litigation.SelectedItem.Value;
            }
            else
            {
                lr.LR_whether_freefrom_enchroachmnt_or_litigation = ddl_whether_freefrom_encroachment_litigation.SelectedItem.Value;
                whether_freefrom_encroachment_litigation = lr.LR_whether_freefrom_enchroachmnt_or_litigation;
            }
        }

        string whether_inst_leased_land_or_not = "";
        string whether_inst_leased_land_or_notareadetails = "";
        string whether_inst_leased_land_or_notperioddetails = "";


        if (ddl_whether_inst_leased_land_or_not.SelectedItem.Value != "-1")
        {
            if (ddl_whether_inst_leased_land_or_not.SelectedItem.Value == "no")
            {
                lr.LR_whether_institute_leased_land_orgn_or_not = ddl_whether_inst_leased_land_or_not.SelectedItem.Value;
                whether_inst_leased_land_or_not = lr.LR_whether_institute_leased_land_orgn_or_not;
            }
            else
            {
                lr.LR_whether_institute_leased_land_orgn_or_not = ddl_whether_inst_leased_land_or_not.SelectedItem.Value;
                lr.LR_institute_leased_land_area_in_hect = txt_area_in_hectares.Text;
                lr.LR_institute_leased_land_lease_period = txt_lease_period.Text;
                whether_inst_leased_land_or_not = lr.LR_whether_institute_leased_land_orgn_or_not;
                whether_inst_leased_land_or_notareadetails = lr.LR_institute_leased_land_area_in_hect;
                whether_inst_leased_land_or_notperioddetails = lr.LR_institute_leased_land_lease_period;
            }
        }

        SqlParameter[] param = new SqlParameter[] { 

        new SqlParameter("@user_id", user.userid),
         new SqlParameter("@org_id", ddl_institute.SelectedValue),
         //new SqlParameter("@state", lr.LR_state),
         // new SqlParameter("@district",lr.LR_district),
         //  new SqlParameter("@latitude", lr.LR_latitude),
          //  new SqlParameter("@longitude", lr.LR_longitude),
             new SqlParameter("@height_from_msl", lr.LR_height_from_msl),
              new SqlParameter("@total_land_area_in_hectare", lr.LR_total_land_area_in_hectare),
               new SqlParameter("@LandUtiliz_details_in_hectare",lr.LR_LandUtiliz_details_in_hectare),
                new SqlParameter("@LandUtiliz_farmarea_researcharea",lr.LR_LandUtiliz_farmarea_researcharea),
                 new SqlParameter("@LandUtiliz_area_under_buildings", lr.LR_LandUtiliz_area_under_buildings),
                  new SqlParameter("@LandUtiliz_area_under_sportgrounds_park_or_green", lr.LR_LandUtiliz_area_under_sportgrounds_park_or_green),
                   new SqlParameter("@LandUtiliz_areanotutilized_vacantland", lr.LR_LandUtiliz_areanotutilized_vacantland),
                    new SqlParameter("@owner_desc_asper_revenue_record", lr.LR_owner_desc_asper_revenue_record),
                     new SqlParameter("@possession_asper_revenue_record", lr.LR_possession_asper_revenue_record),
                       new SqlParameter("@date_of_acquistion", lr.LR_date_of_acquistion),
                      new SqlParameter("@whether_landhold_free_or_lease", lr.LR_whether_landhold_free_or_lease),
                      new SqlParameter("@whether_title_favaour_of_icar_or_not", lr.LR_whether_title_favaour_of_icar_or_not),
                       new SqlParameter("@whether_freefrom_encroachment_litigation", whether_freefrom_encroachment_litigation),
                        new SqlParameter("@whether_freefrom_encroachment_litigation_not_details", whether_freefrom_encroachment_litigationnotdetails),                     
                         new SqlParameter("@lease_leaseperiod",lr.LR_lease_leaseperiod),
                         new SqlParameter("@lease_start_of_lease", Convert.ToString(lr.LR_lease_start_of_lease)),
                          new SqlParameter("@lease_renewal_of_lease", Convert.ToString(lr.LR_lease_renewal_of_lease)),
                            new SqlParameter("@whether_inst_leased_land_or_not", whether_inst_leased_land_or_not),
                         new SqlParameter("@institute_leased_land_area_in_hect", whether_inst_leased_land_or_notareadetails),
                          new SqlParameter("@institute_leased_land_lease_period",whether_inst_leased_land_or_notperioddetails),                          
                         new SqlParameter("@whether_anydisputes_or_court_cases", lr.LR_whether_any_disputes_or_court_cases),
                          new SqlParameter("@status_of_anydisputes_or_court_cases",lr.LR_status_of_disputes_or_court_cases),
                           new SqlParameter("@date_of_anydisputes_or_court_cases", lr.LR_date_of_disputes_or_court_cases),
                             new SqlParameter("@incase_sg_seeking_return_of_land", lr.LR_incase_sg_seeking_return_of_land),
                         new SqlParameter("@brief_note_proposal_status_submittedto_sg",lr.LR_brief_note_proposal_status_submittedto_sg),
                          new SqlParameter("@any_other_information", lr.LR_any_other_information),
    };


        string query = @" insert into LandRecord(landrecorduserid,organizationid,heightmsl,totallandhectare,landutilizdetailsfarmresarea,landutilizdetailsareaunderbuildngs,landutilizdetailsareaunderspgrndpa,landutilizdetailsforestarea,landutilizdetailsareanotutlzdvacland,ownershipdesc,possessiondetails,dateofacquistion,landholdtype,landititleclearornot,landfreefromencorliti,landfreefromencorlitiifnodetails,landleaseperiod,landdateofstartlease,landdateofrenewallease,leasedlandstatusotherthanicar,leasedstatusyareaofhect,leasedstatusyperiod,landrecorddisputescourtcasestatus,statusofdisputescourtcases,dateofdisputescourtcases,returnoflanddetails,proposalsubmittedstatus,anyotherinfo,entrydate)
output INSERTED.sno values(@user_id,@org_id,@height_from_msl,@total_land_area_in_hectare,@LandUtiliz_details_in_hectare,@LandUtiliz_farmarea_researcharea,@LandUtiliz_area_under_buildings,@LandUtiliz_area_under_sportgrounds_park_or_green,@LandUtiliz_areanotutilized_vacantland,@owner_desc_asper_revenue_record,@possession_asper_revenue_record,@date_of_acquistion,@whether_landhold_free_or_lease,@whether_title_favaour_of_icar_or_not,@whether_freefrom_encroachment_litigation,@whether_freefrom_encroachment_litigation_not_details,@lease_leaseperiod,@lease_start_of_lease,@lease_renewal_of_lease,@whether_inst_leased_land_or_not,
@institute_leased_land_area_in_hect,@institute_leased_land_lease_period,@whether_anydisputes_or_court_cases,@status_of_anydisputes_or_court_cases,@date_of_anydisputes_or_court_cases,@incase_sg_seeking_return_of_land,@brief_note_proposal_status_submittedto_sg,@any_other_information,getdate())";

        string st = ac.WriteNotSP(query, param.ToArray());
        //Response.Write(st);
        if (Convert.ToInt32(st) > 0)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "", "$('#mytoast').toast('show')", true);
            lblmsg.Text = "<h3>Records saved successfully</h3>";
            divtoast.Visible = true;
            //lbl_msg.Text = "Records saved successfully";
            // lbl_msg.Visible = true;
            clear();
        }
        else
        {
            lbl_msg.Visible = false;
        }
    }
    protected void clear()
    {
        //ddl_institute.SelectedIndex = 0;
        // ddl_state.SelectedIndex = 0;
        // ddl_district.SelectedIndex = 0;
        // txt_latitude.Text = "";
        // txt_longitude.Text = "";
        txt_height_from_msl.Text = "";
        txt_total_land_area_hectare.Text = "";
        txt_landutilization_details_in_hectare.Text = "";
        txt_farm_or_research_area.Text = "";
        txt_area_under_forest.Text = "";
        txt_area_under_buildings.Text = "";
        txt_area_under_sportsparkgreenarea.Text = "";
        txt_area_notutilized_vacantland.Text = "";
        txt_ownership_desc_asper_revenue_record.Text = "";
        txt_possession_asper_revenue_record.Text = "";
        ddl_land_type.SelectedIndex = 0;
        ddl_whether_title_infavour_of_icar_ornot.SelectedIndex = 0;
        ddl_whether_freefrom_encroachment_litigation.SelectedIndex = 0;
        txt_whether_freefrom_encroachment_litigation.Text = "";
        txt_lease_period.Text = "";
        txt_startdate_of_lease.Text = "";
        txt_renewaldate_of_lease.Text = "";
        ddl_whether_inst_leased_land_or_not.SelectedIndex = 0;
        txt_area_in_hectares.Text = "";
        txt_period_of_lease.Text = "";
        ddl_whether_anydispute_or_course_cases.SelectedIndex = 0;
        txt_status_of_disputes_court_cases.Text = "";
        txt_date_of_disputes_court_cases.Text = "";
        txt_sg_seeking_return_of_land.Text = "";
        txt_brief_note_status_of_proposal_submitted_sg.Text = "";
        txt_any_other_info.Text = "";

    }
    protected void ddl_whether_freefrom_encroachment_litigation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_whether_freefrom_encroachment_litigation.SelectedItem.Value != "-1")
        {
            if (ddl_whether_freefrom_encroachment_litigation.SelectedItem.Value == "no")
            {
                divfreeencroachmentlitifationstatus.Visible = true;
            }
            else
            {
                divfreeencroachmentlitifationstatus.Visible = false;
            }
        }
        else
        {

        }
    }
    protected void ddl_whether_inst_leased_land_or_not_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_whether_inst_leased_land_or_not.SelectedItem.Value != "-1")
        {
            if (ddl_whether_inst_leased_land_or_not.SelectedItem.Value == "yes")
            {
                divleaselandstatus.Visible = true;
            }
            else
            {
                divleaselandstatus.Visible = false;
            }
        }
        else
        {

        }
    }
    protected void ddl_institute_OnSelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_institute.SelectedItem.Value != "-1")
        {
            BindValues(ddl_institute.SelectedItem.Value);
        }
        else
        {

        }
    }
    protected void ddl_anydispute_or_course_cases_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddl_whether_anydispute_or_course_cases.SelectedItem.Value != "-1")
        {
            if (ddl_whether_anydispute_or_course_cases.SelectedItem.Value == "yes")
            {
                divdisputescourtcases.Visible = true;
            }
            else
            {
                divdisputescourtcases.Visible = false;
            }
        }
        else
        {

        }
    }
}