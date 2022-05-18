<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAfterLogin.master" Debug="true" CodeFile="ViewReportDow.aspx.cs" Inherits="ViewReportDow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="container">
    <div class="col-md-12 row mt-1">
            
                <div class="col-md-1">
                </div>
                <div class="col-md-11 text-center">
                    <label for="name" class="control-label">
                        <h2>
                            <font color="midnightblue" face="Trebuchet MS">
                           </font></h2>
                    </label>
                     <div class="panel panel-default bg-success ">
  <div class="panel-body">
    <h2 class="text-white">
                            
                            View Report</h2>
  </div>
</div>
                </div>
                <div class="col-md-3">
                </div>
            </div>
             <div class="col-md-12 row" >
                <div class="col-md-3">
                </div>
             
                <div class="col-md-3">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">SMD Name</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddl_smd_name" runat="server" AutoPostBack="True" Width="320px"
                        onselectedindexchanged="ddl_smd_name_SelectedIndexChanged" AppendDataBoundItems="true">
                         <asp:ListItem Value="-1">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
              <div class="col-md-12 row" >
                <div class="col-md-3">
                </div>
              
                <div class="col-md-3">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Institute</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
               
                  <asp:DropDownList ID="ddl_institute" runat="server" AutoPostBack="True"  Width="320px"
                        onselectedindexchanged="ddl_institute_SelectedIndexChanged" AppendDataBoundItems="true">
                        <asp:ListItem Value="-1">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
              <div class="col-md-12 row" >
                <div class="col-md-3">
                </div>
                       <div class="col-md-3">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Regional Station</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
               <asp:DropDownList ID="ddl_regional_station" runat="server" AutoPostBack="true"  Width="320px">
                <asp:ListItem Value="-1">Please Select</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
              <div class="col-md-12 row" >
                <div class="col-md-3">
                </div>
                <div class="col-md-8 mt-2 text-center">
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="btn-danger btn-sm" OnClick="ButtonSubmit_OnClick"/>
                </div>
                </div>

                  <div class="col-md-12 row mt-3" id="divgridreport" runat="server" visible="false" >
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <font size="2" color="midnightblue" face="Trebuchet MS">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                            EmptyDataRowStyle-CssClass="text-danger" EmptyDataText="No Records Found" ShowHeaderWhenEmpty="true">
                            <Columns>
                                <asp:TemplateField HeaderText="S. No.">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_sno" runat="server" Text='<%# Container.DataItemIndex + 1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name of Institute">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_name_of_institute" runat="server" Text='<%# Bind("name1") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_state" runat="server" Text='<%# Bind("state") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="District">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_district" runat="server" Text='<%# Bind("district") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Submission status">
                                    <ItemTemplate>
                                        <asp:Label ID="lbl_submission_status" runat="server" Text='<%# Bind("entrydate1") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField> 
                                <asp:TemplateField HeaderText="View Report">
                                    <ItemTemplate>
                                     <asp:HyperLink ID="HyperLinkPDF" runat="server" Text="View" CssClass="btn btn-outline-link" NavigateUrl='<%# "~/ProformaofLandRecordReport.aspx?userid=" + Eval("landrecorduserid")+"&sn="+Eval("sno")+"&orgnid="+Eval("orgid")+"&orgid="+ Eval("organizationid")%>' ></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>                              
                            </Columns>
                            <HeaderStyle ForeColor="white" BackColor="#2DA749" />
                            <AlternatingRowStyle BackColor="#F0F8FF" ForeColor="Black" />
                            <RowStyle BackColor="#FFFFFF" ForeColor="Black" />
                        </asp:GridView>
                    </font>
                </div>
                <div class="col-md-3">
                </div>
            </div>
</div>
  <div id="divtoast" class="container mt-4" runat="server" visible="false">
        <!--show toast -->
        <div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center"
            style="min-height: 0px;">
            <div class="card shadow">
                <div class="toast" id="mytoast" role="alert" aria-live="polite" aria-atomic="true"
                    data-delay="5000">
                    <div class="toast-body bg-danger text-white">
                        <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div>
            <!--end of show toast -->
        </div>
    </div> 
</asp:Content>

