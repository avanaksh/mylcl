<%@ Page Language="C#" Debug="true"  MasterPageFile="MasterAfterLogin.master"
    CodeFile="ProformaofLandRecordReport.aspx.cs" Inherits="ProformaofLandRecordReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script language="javascript" type="text/javascript">
     function printDiv() {
         $("#printableArea").css("display", "block");
         $('h2').removeClass();
         $("#h2lrr").css("text-white", "text-primary");
       
         var printContents = document.getElementById('<%=printableArea.ClientID %>').innerHTML;
         //var printContentsHeader = document.getElementById(Header);

         //printContentsHeader.style.visibility = 'visible';
         var originalContents = document.body.innerHTML;

         //$("#id").css("display", "block");

         document.body.innerHTML = printContents;

         window.print();

         document.body.innerHTML = originalContents;
         $("#h2lrr").css("text-primary", "text-white");
         $("#printableArea").css("display", "none");
         window.location.reload();
     } 
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container shadow p-3 mb-5 rounded border-info">
        <div class="">
         <div class="col-md-12 row mt-1">
            <div class="col-md-1">
                </div>
                 <div class="col-md-11 text-center">
                 <% if(user.usertype=="3")  {%>
                 <a href="ViewReportDow.aspx" class="btn btn-secondary btn-sm" style="font-size:large">Back</a>
                 <%}else{ %>
                  <a href="ViewLandReport.aspx" class="btn btn-secondary btn-sm" style="font-size:large">Back</a>
                 <%} %>
                 </div>
         </div>
          <div class="col-md-12 row mt-1">
            <div class="col-md-1">
                </div>
                 <div class="col-md-11 text-center">
                   <input type="button" onclick="printDiv()" value="Print" class="btn  btn-info btn-sm"  />
                 </div>
                 </div>
                   <div id="printableArea"  runat="server" >
            <div class="col-md-12 row mt-1">
                <div class="col-md-1">
                </div>
                <div class="col-md-11 text-center">
                    <label for="name" class="control-label">
                        <h2>
                            <font color="midnightblue" face="Trebuchet MS">
                           </font>
                        </h2>
                    </label>
                    <div class="panel panel-default bg-success ">
                        <div class="panel-body">
                            <h2 class="text-white" id="h2lrr" runat="server">
                                Land Record Report</h2>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    1.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Name of the Institute</font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lbl_institute" runat="server" Width="300px">
                    </asp:Label>
                    <%--<asp:TextBox ID="lbl_studentname" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    2.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">State</font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lbl_state" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    3.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">District </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lbl_district" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    4.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Address </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lbl_address" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    5.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Latitude</font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lbl_latitude" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    6.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Longitude </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%-- <asp:TextBox ID="txt_longitude" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_longitude" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    7.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Height from Mean Sea Level (in meters)
                            </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%-- <asp:TextBox ID="txt_height_from_msl" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_height_from_msl" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    8.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Total land area (in hectare)  
                            </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--<asp:TextBox ID="txt_total_land_area_hectare" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_total_land_area_hectare" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    9.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Land Utilization details (in hectare)  </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--  <asp:TextBox ID="txt_landutilization_details_in_hectare" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_landutilization_details_in_hectare" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-2">
                </div>
                <div class="col-md-4">
                    i.
                    <label for="name" class="control-label">
                        <h5>
                            <font size="2" color="midnightblue" face="Trebuchet MS">Farm area/Research area :  </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%-- <asp:TextBox ID="txt_farm_or_research_area" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_farm_or_research_area" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-2">
                </div>
                <div class="col-md-4">
                    ii.
                    <label for="name" class="control-label">
                        <h5>
                            <font size="2" color="midnightblue" face="Trebuchet MS">Area under buildings :  </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--   <asp:TextBox ID="txt_area_under_buildings" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_area_under_buildings" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-2">
                </div>
                <div class="col-md-4">
                    iii.
                    <label for="name" class="control-label">
                        <h5>
                            <font size="2" color="midnightblue" face="Trebuchet MS"> Area under Sports Ground/Park/Green area :  </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%-- <asp:TextBox ID="txt_area_under_sportsparkgreenarea" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_area_under_sportsparkgreenarea" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-2">
                </div>
                <div class="col-md-4">
                    iv.
                    <label for="name" class="control-label">
                        <h5>
                            <font size="2" color="midnightblue" face="Trebuchet MS">Forest area  :  </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%-- <asp:TextBox ID="txt_area_under_forest" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_area_under_forest" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-2">
                </div>
                <div class="col-md-4">
                    v.
                    <label for="name" class="control-label">
                        <h5>
                            <font size="2" color="midnightblue" face="Trebuchet MS">Area not utilized/Vacant land  :  </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--   <asp:TextBox ID="txt_area_notutilized_vacantland" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_area_notutilized_vacantland" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    10.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Ownership description as per revenue record	
                            </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--<asp:TextBox ID="txt_ownership_desc_asper_revenue_record" runat="server" Text="" TextMode="MultiLine" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_ownership_desc_asper_revenue_record" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    11.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Date of Possession as per revenue record
                            </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%-- <asp:TextBox ID="txt_possession_asper_revenue_record" runat="server" Text="" TextMode="MultiLine" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_possession_asper_revenue_record" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    12.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Date of acquistion
                            </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%-- <asp:TextBox ID="txt_possession_asper_revenue_record" runat="server" Text="" TextMode="MultiLine" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_date_of_acquistion" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    13.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Whether land is free hold/lease hold
                            </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--   <asp:DropDownList ID="ddl_land_type" runat="server" Width="220px">
                      <asp:ListItem Value="-1">Please Select</asp:ListItem>
                    <asp:ListItem Value="free hold">Free hold</asp:ListItem>
                    <asp:ListItem Value="lease hold">Lease hold</asp:ListItem>
                    </asp:DropDownList>--%>
                    <asp:Label ID="lbl_land_type" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    14.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Whether title is clear in favour of ICAR or not
                            </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--  <asp:DropDownList ID="ddl_whether_title_infavour_of_icar_ornot" runat="server" Width="220px">
                      <asp:ListItem Value="-1">Please Select</asp:ListItem>
                    <asp:ListItem Value="yes">Yes</asp:ListItem>
                    <asp:ListItem Value="no">No</asp:ListItem>
                    </asp:DropDownList>--%>
                    <asp:Label ID="lbl_whether_title_infavour_of_icar_ornot" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    15.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <font size="3" color="midnightblue" face="Trebuchet MS">Whether free from encroachment/litigation,
                            </font>
                    </label>
                </div>
                <div class="col-md-3">
                    <%-- <asp:DropDownList ID="ddl_whether_freefrom_encroachment_litigation" 
                        runat="server" Width="220px" AutoPostBack="True" 
                        onselectedindexchanged="ddl_whether_freefrom_encroachment_litigation_SelectedIndexChanged" >
                      <asp:ListItem Value="-1">Please Select</asp:ListItem>
                    <asp:ListItem Value="yes">Yes</asp:ListItem>
                    <asp:ListItem Value="no">No</asp:ListItem>
                    </asp:DropDownList>--%>
                    <asp:Label ID="lbl_whether_freefrom_encroachment_litigation" runat="server" Width="300px">
                    </asp:Label>
                </div>
                <div class="col-md-3">
                </div>
            </div>
            <div class="col-md-12 row" id="divfreeencroachmentlitifationstatus" runat="server"
                visible="false">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <font size="3" color="midnightblue" face="Trebuchet MS">If not, details be given
                            </font>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--<asp:TextBox ID="txt_whether_freefrom_encroachment_litigation" runat="server" Text="" TextMode="MultiLine" Width="220px"></asp:TextBox><br/>
                    <font size="2" color="red">in not more than 100 words</font>--%>
                    <asp:Label ID="lbl_whether_freefrom_encroachment_litigation_details" runat="server"
                        Width="300px">
                    </asp:Label>
                </div>
                <div class="col-md-3" style="display: none">
                    <asp:FileUpload ID="FileUploadencliti" runat="server" /><br />
                    <font size="2" color="red">upload file in .doc/.docx</font>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    16.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">In case of lease land, </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="txt_in_caseof_lease_land" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-2">
                </div>
                <div class="col-md-4">
                    i.
                    <label for="name" class="control-label">
                        <h5>
                            <font size="2" color="midnightblue" face="Trebuchet MS">Lease period (in years) :  </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--<asp:TextBox ID="txt_lease_period" runat="server" Text="" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_lease_period" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-2">
                </div>
                <div class="col-md-4">
                    ii.
                    <label for="name" class="control-label">
                        <h5>
                            <font size="2" color="midnightblue" face="Trebuchet MS">Date of start of lease :  </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--<asp:TextBox ID="txt_startdate_of_lease" runat="server" TextMode="Date" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_startdate_of_lease" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-2">
                </div>
                <div class="col-md-4">
                    iii.
                    <label for="name" class="control-label">
                        <h5>
                            <font size="2" color="midnightblue" face="Trebuchet MS">Date of renewal of lease :  </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--<asp:TextBox ID="txt_renewaldate_of_lease" runat="server" TextMode="Date" Width="220px"></asp:TextBox>--%>
                    <asp:Label ID="lbl_renewaldate_of_lease" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    17.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Whether the Institute has Leased land to any organization other than ICAR Institute
                            </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lbl_whether_inst_leased_land_or_not" runat="server" Width="300px">
                    </asp:Label>
                </div>
            </div>
            <div class="col-md-12 row" id="divleaselandstatus" runat="server" visible="false">
                <div class="col-md-12 row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-4">
                        <label for="name" class="control-label">
                            <h5>
                                <font size="3" color="midnightblue" face="Trebuchet MS">If Yes :
                            </font>
                            </h5>
                        </label>
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>
                <div class="col-md-12 row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-4">
                        <label for="name" class="control-label">
                            <h5>
                                <font size="3" color="midnightblue" face="Trebuchet MS">Area (in hectares)
                            </font>
                            </h5>
                        </label>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lbl_area_in_hectares" runat="server" Width="220px"></asp:Label>
                    </div>
                </div>
                <div class="col-md-12 row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-4">
                        <label for="name" class="control-label">
                            <h5>
                                <font size="3" color="midnightblue" face="Trebuchet MS">Period of lease (in years)
                            </font>
                            </h5>
                        </label>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lbl_period_of_lease" runat="server" Width="220px"></asp:Label>
                    </div>
                </div>
            </div>
             <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    18.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Any disputes/court cases</font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:Label ID="lbl_whether_any_disputes_court_cases" runat="server" Width="300px">
                    </asp:Label>
                </div>
                <div class="col-md-3" >
                   
                </div>
            </div> 

 <div class="col-md-12 row" id="divdisputescourtcasesstatus" runat="server" visible="false">
                <div class="col-md-12 row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-4">
                        <label for="name" class="control-label">
                            <h5>
                                <font size="3" color="midnightblue" face="Trebuchet MS">If Yes :
                            </font>
                            </h5>
                        </label>
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>
                <div class="col-md-12 row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-4">
                        <label for="name" class="control-label">
                            <h5>
                                <font size="3" color="midnightblue" face="Trebuchet MS">Status of disputes or court cases
                            </font>
                            </h5>
                        </label>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lbl_status_disputes_or_court_cases" runat="server" Width="220px"></asp:Label>
                    </div>
                </div>
                <div class="col-md-12 row">
                    <div class="col-md-2">
                    </div>
                    <div class="col-md-4">
                        <label for="name" class="control-label">
                            <h5>
                                <font size="3" color="midnightblue" face="Trebuchet MS">Date of disputes or court cases
                            </font>
                            </h5>
                        </label>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lbl_date_of_disputes_court_cases" runat="server" Width="220px"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    19.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">In case, the State Govt. is seeking return of land from the Institute prematurely even when the lease period is not over, may also be indicated</font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%-- <asp:TextBox ID="txt_sg_seeking_return_of_land" runat="server" TextMode="MultiLine" Text="" Width="220px"></asp:TextBox><br/>
                    <font size="2" color="red">in not more than 100 words</font>--%>
                    <asp:Label ID="lbl_sg_seeking_return_of_land" runat="server" Width="300px">
                    </asp:Label>
                </div>
                <div class="col-md-3" style="display: none">
                    <asp:FileUpload ID="FileUploadretlandsg" runat="server" /><br />
                    <font size="2" color="red">upload file in .doc/.docx</font>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    20.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">A brief note about status of proposal submitted to State Government for renewal and response of State Government
</font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%-- <asp:TextBox ID="txt_brief_note_status_of_proposal_submitted_sg" runat="server" TextMode="MultiLine" Text="" Width="220px"></asp:TextBox><br/>
                    <font size="2" color="red">in not more than 100 words</font>--%>
                    <asp:Label ID="lbl_brief_note_status_of_proposal_submitted_sg" runat="server" Width="300px">
                    </asp:Label>
                </div>
                <div class="col-md-3" style="display: none">
                    <asp:FileUpload ID="FileUploadpropsubmtosg" runat="server" /><br />
                    <font size="2" color="red">upload file in .doc/.docx</font>
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-1">
                </div>
                <div class="col-md-1">
                    21.
                </div>
                <div class="col-md-4">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Any other information
</font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <%--<asp:TextBox ID="txt_any_other_info" runat="server" TextMode="MultiLine" Text="" Width="220px"></asp:TextBox><br/>
                    <font size="2" color="red">in not more than 100 words</font>--%>
                    <asp:Label ID="lbl_any_other_info" runat="server" Width="300px">
                    </asp:Label>
                </div>
                <div class="col-md-3" style="display: none">
                    <asp:FileUpload ID="FileUploadani" runat="server" /><br />
                    <font size="2" color="red">upload file in .doc/.docx</font>
                </div>
            </div>
            </div>
            <asp:Label ID="lbl_semester" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="lbl_academicyear" runat="server" Text="Label" Visible="False"></asp:Label>
        
            <h3 class="text-center text-danger">
                <asp:Label ID="lbl_msg" runat="server" Text="" Visible="false"></asp:Label></h3>
        </div>
    </div>
     
</asp:Content>
