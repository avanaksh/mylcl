<%@ Page Language="C#" Debug="true" MasterPageFile="MasterAfterLogin.master" CodeFile="ViewLandReport.aspx.cs" Inherits="ViewLandReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

     <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <div id="divtoast" class="container mt-2" runat="server" visible="false">
        <!--show toast -->
        <div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center"
            style="min-height: 0px;">
            <div class="card shadow">
                <div class="toast" id="mytoast" role="alert" aria-live="polite" aria-atomic="true"
                    data-delay="5000">
                    <div class="toast-body bg-dark text-white">
                        <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div>
            <!--end of show toast -->
        </div>
    </div>   
     <div class="container shadow p-3 mb-5 rounded border-info">
    <div class="container  ">
           
            
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
                            
                            Land Record Report</h2>
  </div>
</div>
                </div>
                <div class="col-md-3">
                </div>
            </div>
              <div class="col-md-12 row" >
                <div class="col-md-3">
                </div>
               <%--  <div class="col-md-1">
                 1.
                </div>--%>
                <div class="col-md-3">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Name of the Institute</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                     <asp:DropDownList ID="ddl_institute" runat="server" Width="320px" 
                      AppendDataBoundItems="true" >
                    <asp:ListItem Value="-1">Please Select</asp:ListItem>
                  
                    </asp:DropDownList>
                </div>
            </div>
              <div class="col-md-12 row" style="display:none">
                <div class="col-md-3">
                </div>
               <%--  <div class="col-md-1">
                 2.
                </div>--%>
                <div class="col-md-3">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">State</font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                     <asp:DropDownList ID="ddl_state" runat="server" Width="220px" 
                      AppendDataBoundItems="true"  OnSelectedIndexChanged="ddl_state_OnSelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="-1">Please Select</asp:ListItem>
                  
                    </asp:DropDownList>
                </div>
            </div>
             <div class="col-md-12 row" style="display:none">
                <div class="col-md-3">
                </div>
                <%-- <div class="col-md-1">
                 3.
                </div>--%>
                <div class="col-md-3">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">District </font>
                        </h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddl_district" AppendDataBoundItems="true" runat="server" Width="220px">
                     <asp:ListItem Value="-1">Please Select</asp:ListItem>                   
                    </asp:DropDownList>
                </div>
            </div>
              <div class="col-md-12 row" >
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-6 text-center">
                        <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" OnClick="ButtonSubmit_Click" 
                            CssClass="btn btn-outline-primary btn-sm"  />
                    </div>
                    <div class="col-md-3">
                    </div>
                </div>

                <div id="divreport" runat="server" visible="false">
                  <div class="col-md-12 row mt-2">
                <div class="col-md-1">
                </div>
                <div class="col-md-11 text-center">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="5" color="midnightblue" face="Trebuchet MS">Land Record Report</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                </div>
            </div>
            <div class="col-md-12 row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6 text-center">
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
    
    </div>
    </div>
    </asp:Content>
 
