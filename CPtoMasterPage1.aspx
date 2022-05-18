<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" Debug="true" CodeFile="CPtoMasterPage1.aspx.cs" Inherits="CPtoMasterPage1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
   <div class="container" >
    <div class="row">
  
<div class="col-md-12 row">
<%--<div class="col-md-1" ></div>--%>
<div class="col-md-9" >
<div class="card mt-2" style="background-color:#E18B35; height:300px;width:820px;">
 <div class="card-body">
 <h6 class="card-title text-white text-center">Home</h6>
 <p class="text-justify text-white">
 ICAR- Land Records Management System (LRMS) is an integrated system which provides land record information of all institutions along with their Regional Stations. The system keeps the online record as total land area, land utilization details (Farm area, Research Area, area under building, area under sports ground/park/green area, forest area, vacant land), Ownership description as per revenue record, Date of Possession as per revenue record, Date Acquisition, Free hold land/leased hold, Lease Period, Date Start for lease, Date of renewal of Lease etc.
 </p>
 <p class="text-justify text-white">ICAR-LRMS would save time and energy unnecessarily required for collection of data repeatedly and also help in better management of land record in future. The information obtained from this system can be readily used for deciding the future policies for land management by council. ICAR-LRMS would also generate advisory and send an email to the Director of the institute, Administrate Head (Head of Office) along with Director (Works) about expiry of lease where lease would expire within one year.</p>
 <p class="text-justify text-white">This software has been developed by IT Unit, ICAR-IASRI in collaboration with ICT Section of ICAR Hq.</p>
</div>
</div>
</div>
<div class="col-md-3 pr-0">
<div class="card mt-2 " style="width:250px;height:300px;background:#F0A178">
 <div class="card-body">
    <h6 class="card-title text-white mb-3 text-center">Login credentials</h6>
     <div class="row mt-3">
    <div class="col-md-8">
      <label for="txtUsername" class="text-white">Username</label>
   
     <asp:TextBox ID="txtUsername" runat="server" style="height:35px;background:#FEF8ED"></asp:TextBox>
      </div>
    </div>
    <div class="row mt-3">
    <div class="col-md-8">
      <label for="txtPassword" class="text-white">Password</label>
     
        <asp:TextBox ID="txtPassword" runat="server" style="height:35px;background:#FEF8ED" TextMode="Password"></asp:TextBox>
      </div>
    </div>  
    <div class="row">
    <div class="col-md-8">
      <asp:LinkButton ID="ButtonSignIn" runat="server" CssClass="btn btn-info btn-sm mt-4" Text="Sign-In" OnClick="ButtonSignIn_OnClick" />
      </div>
      </div>
       <div class="row">
    <div class="col-md-8 mt-2">
  <a class="btn-outline-primary text-white" href="#" data-toggle="modal" style="height:45px;text-decoration:none;" data-target="#exampleModal">Forgot password</a> 

    </div>
      </div>
  </div>
</div>
</div>
</div>
</div>
    <div class="row">
  
<div class="col-md-12 row">
<div class="col-md-6" >
<div class="card mt-2 bg-success" style="height:340px;width:540px;">
 <div class="card-body">
 <h6 class="card-title text-white text-center">Subject matter division wise land holding of ICAR Institutes</h6>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" >
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
     <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="image/capturelandholdas.JPG" class="d-block w-100" alt="..." width="200px" height="270px">
    </div>
    <div class="carousel-item">
      <img src="image/capturelandholdfs.JPG" class="d-block w-100" alt="..." width="200px" height="270px">
    </div>
    <div class="carousel-item">
      <img src="image/capturelandholdhs.JPG" class="d-block w-100" alt="..." width="200px" height="270px">
    </div>
      <div class="carousel-item">
      <img src="image/capturelandholdnrm.JPG" class="d-block w-100" alt="..." width="200px" height="270px">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
</div>

</div>
<div class="col-md-6">
<div class="card mt-2 bg-info" style="height:340px;width:525px;">

 <div class="card-body">
 <h6 class="card-title text-white text-center">Land holding of ICAR Institutes</h6>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" Width="100%">
      <Columns>
          <asp:TemplateField HeaderText="SrNo." Visible="false"> 
             <ItemTemplate>                                                              
            <%#Container.DataItemIndex+1%>                                                
             </ItemTemplate>
                                                                   
                   </asp:TemplateField>

              <asp:TemplateField HeaderText="Name of SMD">
           <ItemTemplate >
              <asp:Label ID="lblCourseLeaderName" runat="server"  Text='<%# Eval("nameofsmd") %>' >
		</asp:Label>
           </ItemTemplate>
                      </asp:TemplateField>
               
             <asp:TemplateField HeaderText="Number of Institutes">
           <ItemTemplate >
              <asp:Label ID="lblCourseCode" runat="server" Text='<%# Eval("nameofinstitutes") %>' >
		</asp:Label>
           </ItemTemplate>
                      </asp:TemplateField>
        
             <asp:TemplateField HeaderText="Total Area (in Acres)">
           <ItemTemplate >
        
              <asp:Label ID="lblCourseTitle" runat="server" Text='<%# Eval("totalareainhectares") %>' >
		</asp:Label>
           </ItemTemplate>


                     </asp:TemplateField>   
          <asp:TemplateField HeaderText="% of Total SMD Area">
           <ItemTemplate >
           
              <asp:Label ID="lblDiscipline" runat="server" Text='<%# Eval("percentageoftotalarea") %>' >
		</asp:Label>
           </ItemTemplate>
                      </asp:TemplateField>
                         
                    
                     
        
            
            </Columns>
            <RowStyle BackColor="white"  ForeColor="black" />
             <HeaderStyle BackColor="#FEF8ED" Font-Bold="True" ForeColor="#BA1F3C" />
    </asp:GridView>
    </div>
</div>
</div>


</div>
</div>
 <%--<div class="row mt-2 mb-2">
<div class="col-md-12 row">
<div class="col-md-1">
</div>

</div>
</div>--%>
 <!--Modal Forgot Password -->
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content bg-light text-dark">
      <div class="modal-header bg-success " style="height:50px">
        <h5 class="modal-title text-white" id="exampleModalLabel">Forgot Password</h5>
        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
     <%-- <h2 class="text-center bg-light text-dark">Forgot Password</h2>--%>
        <div class="container-fluid">
    <div class="col-md-12 row">
   
    <div class="col-md-6">
    <h5><label for="" class="bg-light text-dark">Email</label></h5>    
    </div>
    <div class="col-md-3">
        <asp:TextBox ID="txtEmailIdfpwd" runat="server"></asp:TextBox>
    </div>
     <div class="col-md-3"></div>
    </div>
    </div>
      </div>
      <div class="modal-footer">
          <asp:Button ID="ButtonSubmitfpwd" runat="server" Text="Submit" ValidationGroup="oo"  CssClass="btn btn-primary btn-sm"
              onclick="ButtonSubmitfpwd_Click" />
                <button type="button" class="btn btn-info btn-sm" data-dismiss="modal">
                                Close</button>

      </div>
    </div>
  </div>  
</div>
    <!--End of Forgot Password -->
 <!--Modal Save -->
   <%-- <div class="modal fade" id="myModalSave" role="dialog" aria-labelledby="exampleModalSave" aria-hidden="true" runat="server" visible="false">
                <div class="modal-dialog modal-dialog-centered">
                    <!-- Modal content-->
                    <div class="modal-content bg-light text-dark">
                        <div class="modal-header bg-light text-dark" style="height:50px">                           
                            <h4 class="modal-title text-center" id="exampleModalSave">
                                <asp:Image ID="Image10" runat="server" Width="30px"/>
                                 </h4>
                                 <button type="button" class="close" data-dismiss="modal">
                                &times;</button>
                        </div>
                        <div class="modal-body bg-light text-dark text-center">
                          <div class="col-md-12">                              
                            <div class="row">
                                <asp:Label ID="lblmodalmessage" runat="server" Text="" Visible="false" ></asp:Label>
                                </div>                         
                        </div>
                        </div>
                        <div class="modal-footer">                     
                            <button type="button" class="btn btn-info" data-dismiss="modal">
                                Close</button>
                        </div>
                    </div>
                </div>
            </div>--%>
    <!--Save -->
</div>
</asp:Content>

