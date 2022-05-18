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

public partial class ProformaofLandRecordReport : System.Web.UI.Page
{
    ConnectionClass conClass = new ConnectionClass();
    ActionClass ac = new ActionClass();
    SqlConnection con;
    DataSet ds = new DataSet();
    CommonMethodsL cm = new CommonMethodsL();
    public Users user;

    public string varUserTypeId, varRollNo, varStudUser, varStudDisciplineID, ppw, orw, orw1, orw2, orw3, orw4, vardegree, thTitle;
    public string studname, varMajor, varMinor4, varMinor1, varMinor2, varMinor3, varMinor5, varMinor6;
    string discipline, varuserid, varusertypeId, vardisciplineid, varacademicyear, vartrimester, instId,orgid,orgnid,sn;

    public class LandRecord
    {
        public string LR_name_of_institute { get; set; }
        public string LR_state { get; set; }
        public string LR_district { get; set; }
        public string LR_latitude { get; set; }
        public string LR_longitude { get; set; }
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

        orgid = Request.QueryString["orgid"];//Eval("organizationid")
        orgnid = Request.QueryString["orgnid"];
        sn = Request.QueryString["sn"];
        varuserid = Request.QueryString["userid"];

        Label lbluser = (Label)Page.Master.FindControl("lblusername");
        lbluser.Text = user.username;
        if (!IsPostBack)
        {

            BindValues();
        }


    }

    protected void checkLease()
    {

    }

    protected void checkCourtcases()
    {
        //DataSet ds = cm.GetDataByQuery(query);
        //if (ds.Tables[0].Rows.Count > 0)
        //{
        //}
    }

    protected void BindValues()
    {
//        DataSet ds = cm.GetDataByQuery(@"select sno,institutename,state,upper(statedistrictname) as statedistrictname,latitude,longitude,heightmsl,totallandhectare,
//        landutilizdetailsfarmresarea,landutilizdetailsareaunderbuildngs,landutilizdetailsareaunderspgrndpa,landutilizdetailsforestarea,landutilizdetailsareanotutlzdvacland,
//        ownershipdesc,convert(varchar,possessiondetails,103) as possessiondetails,landholdtype,landititleclearornot,landfreefromencorliti,landfreefromencorlitiifnodetails,landleaseperiod,convert(varchar,landdateofstartlease,103) as landdateofstartlease,
//        convert(varchar,landdateofrenewallease,103) as landdateofrenewallease,leasedlandstatusotherthanicar,leasedstatusyareaofhect,leasedstatusyperiod,returnoflanddetails,proposalsubmittedstatus,anyotherinfo,
//        case when entrydate is null then 'Pending' else 'Submitted' end as entrydate from qrylandrecord where landrecordinstid='" + instid + "'");
        DataSet ds = cm.GetDataByQuery(@"select *,(convert(varchar,landdateofrenewallease,103)) as landdateofrenewallease1,(convert(varchar,landdateofstartlease,103)) as landdateofstartlease1,(convert(varchar,possessiondetails,103)) as possessiondetails1,(convert(varchar,dateofacquistion,103)) as dateofacquistion1,(convert(varchar,dateofdisputescourtcases,103)) as dateofdisputescourtcases1 from qryLandRecordms where landrecorduserid='" + varuserid + "' and organizationid='" + orgid + "' and orgid='" + orgnid + "' and sno='" + sn + "'");
        if (ds.Tables[0].Rows.Count > 0)
        {
            lbl_institute.Text = Convert.ToString(ds.Tables[0].Rows[0]["name"]);
            lbl_state.Text = Convert.ToString(ds.Tables[0].Rows[0]["state"]);
            lbl_district.Text = Convert.ToString(ds.Tables[0].Rows[0]["district"]);
            lbl_address.Text = Convert.ToString(ds.Tables[0].Rows[0]["address"]);
            lbl_latitude.Text = Convert.ToString(ds.Tables[0].Rows[0]["latitude"]);
            lbl_longitude.Text = Convert.ToString(ds.Tables[0].Rows[0]["longitude"]);
            lbl_height_from_msl.Text = Convert.ToString(ds.Tables[0].Rows[0]["heightmsl"]);
            lbl_total_land_area_hectare.Text = Convert.ToString(ds.Tables[0].Rows[0]["totallandhectare"]);
            lbl_farm_or_research_area.Text = Convert.ToString(ds.Tables[0].Rows[0]["landutilizdetailsfarmresarea"]);
            lbl_area_under_buildings.Text = Convert.ToString(ds.Tables[0].Rows[0]["landutilizdetailsareaunderbuildngs"]);
            lbl_area_under_sportsparkgreenarea.Text = Convert.ToString(ds.Tables[0].Rows[0]["landutilizdetailsareaunderspgrndpa"]);
            lbl_area_under_forest.Text = Convert.ToString(ds.Tables[0].Rows[0]["landutilizdetailsforestarea"]);
            lbl_area_notutilized_vacantland.Text = Convert.ToString(ds.Tables[0].Rows[0]["landutilizdetailsareanotutlzdvacland"]);
            lbl_ownership_desc_asper_revenue_record.Text = Convert.ToString(ds.Tables[0].Rows[0]["ownershipdesc"]);
            lbl_possession_asper_revenue_record.Text = Convert.ToString(ds.Tables[0].Rows[0]["possessiondetails1"]);
            lbl_date_of_acquistion.Text = Convert.ToString(ds.Tables[0].Rows[0]["dateofacquistion1"]);
            lbl_land_type.Text = Convert.ToString(ds.Tables[0].Rows[0]["landholdtype"]);
            lbl_whether_title_infavour_of_icar_ornot.Text = Convert.ToString(ds.Tables[0].Rows[0]["landititleclearornot"]);

            if (Convert.ToString(ds.Tables[0].Rows[0]["landfreefromencorliti"]) == "no")
            {
                lbl_whether_freefrom_encroachment_litigation.Text = Convert.ToString(ds.Tables[0].Rows[0]["landfreefromencorliti"]);
                lbl_whether_freefrom_encroachment_litigation_details.Text = Convert.ToString(ds.Tables[0].Rows[0]["landfreefromencorlitiifnodetails"]);
                divfreeencroachmentlitifationstatus.Visible = true;
            }
            else
            {
                lbl_whether_freefrom_encroachment_litigation.Text = Convert.ToString(ds.Tables[0].Rows[0]["landfreefromencorliti"]);
                divfreeencroachmentlitifationstatus.Visible = false;
            }

            lbl_lease_period.Text = Convert.ToString(ds.Tables[0].Rows[0]["landleaseperiod"]);
            lbl_startdate_of_lease.Text = Convert.ToString(ds.Tables[0].Rows[0]["landdateofstartlease1"]);
            lbl_renewaldate_of_lease.Text = Convert.ToString(ds.Tables[0].Rows[0]["landdateofrenewallease1"]);


            if (Convert.ToString(ds.Tables[0].Rows[0]["leasedlandstatusotherthanicar"]) == "yes")
            {
                divleaselandstatus.Visible = true;
                lbl_whether_inst_leased_land_or_not.Text = Convert.ToString(ds.Tables[0].Rows[0]["leasedlandstatusotherthanicar"]);
                lbl_area_in_hectares.Text = Convert.ToString(ds.Tables[0].Rows[0]["leasedstatusyareaofhect"]);
                lbl_period_of_lease.Text = Convert.ToString(ds.Tables[0].Rows[0]["leasedstatusyperiod"]);

            }
            else
            {
                divleaselandstatus.Visible = false;
                lbl_whether_inst_leased_land_or_not.Text = Convert.ToString(ds.Tables[0].Rows[0]["leasedlandstatusotherthanicar"]);
            }

            if (Convert.ToString(ds.Tables[0].Rows[0]["landrecorddisputescourtcasestatus"]) == "yes")
            {
                divdisputescourtcasesstatus.Visible = true;
                lbl_whether_any_disputes_court_cases.Text = Convert.ToString(ds.Tables[0].Rows[0]["landrecorddisputescourtcasestatus"]);
                lbl_status_disputes_or_court_cases.Text = Convert.ToString(ds.Tables[0].Rows[0]["statusofdisputescourtcases"]);
                lbl_date_of_disputes_court_cases.Text = Convert.ToString(ds.Tables[0].Rows[0]["dateofdisputescourtcases1"]);

            }
            else
            {
                divdisputescourtcasesstatus.Visible = false;
                lbl_whether_any_disputes_court_cases.Text = Convert.ToString(ds.Tables[0].Rows[0]["landrecorddisputescourtcasestatus"]);
            }


            lbl_sg_seeking_return_of_land.Text = Convert.ToString(ds.Tables[0].Rows[0]["returnoflanddetails"]);
            lbl_brief_note_status_of_proposal_submitted_sg.Text = Convert.ToString(ds.Tables[0].Rows[0]["proposalsubmittedstatus"]);
            lbl_any_other_info.Text = Convert.ToString(ds.Tables[0].Rows[0]["anyotherinfo"]);

        }
        else
        {

        }
    }

    
    


}