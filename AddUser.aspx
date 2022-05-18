<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAfterLogin.master" Debug="true" CodeFile="AddUser.aspx.cs" Inherits="AddUser" %>

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
                            Add User</h2>
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
                            <font size="3" color="midnightblue" face="Trebuchet MS">Username</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
               
                    <asp:TextBox ID="txtUsername" runat="server" style="height:35px;background:#FEF8ED"></asp:TextBox>
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
                            <font size="3" color="midnightblue" face="Trebuchet MS">Password</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                  <asp:TextBox ID="txtPassword" runat="server" style="height:35px;background:#FEF8ED"></asp:TextBox>
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
                            <font size="3" color="midnightblue" face="Trebuchet MS">Website</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                  <asp:TextBox ID="txtWebsite" runat="server" style="height:35px;background:#FEF8ED"></asp:TextBox>
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
                            <font size="3" color="midnightblue" face="Trebuchet MS">Email</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                  <asp:TextBox ID="txtEmail" runat="server" style="height:35px;background:#FEF8ED"></asp:TextBox>
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
                            <font size="3" color="midnightblue" face="Trebuchet MS">Phone</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                  <asp:TextBox ID="txtPhone" runat="server" style="height:35px;background:#FEF8ED"></asp:TextBox>
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
                            <font size="3" color="midnightblue" face="Trebuchet MS">Fax</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                  <asp:TextBox ID="txtFax" runat="server" style="height:35px;background:#FEF8ED"></asp:TextBox>
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
                            <font size="3" color="midnightblue" face="Trebuchet MS">Usertype</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                   <asp:DropDownList ID="ddl_usertype" runat="server" Width="200px">
                   <asp:ListItem Value="1">Clerk</asp:ListItem>
                    </asp:DropDownList>
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
                            <font size="3" color="midnightblue" face="Trebuchet MS">Organization</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddl_org" runat="server"  Width="300px">
                    </asp:DropDownList>
                </div>            </div>
                   <div class="col-md-12 row" >
                <div class="col-md-3">
                </div>
               <%--  <div class="col-md-1">
                 1.
                </div>--%>
                <div class="col-md-3">
                    <label for="name" class="control-label">
                        <h5>
                            <font size="3" color="midnightblue" face="Trebuchet MS">Organization type</font></h5>
                    </label>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddl_org_type" runat="server" Width="300px">
                    </asp:DropDownList>
                </div>            </div>
              <div class="col-md-12 row" >
                <div class="col-md-3">
                </div>
                <div class="col-md-8 mt-2 text-center">
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" CssClass="btn-danger btn-sm" OnClick="ButtonSubmit_OnClick"/>
                </div>
                </div>
</div>
 <div id="divtoast" class="container mt-2" runat="server" visible="false">
        <!--show toast -->
        <div aria-live="polite" aria-atomic="true" class="d-flex justify-content-center align-items-center"
            style="min-height: 0px;">
            <div class="card shadow">
                <div class="toast" id="mytoast" role="alert" aria-live="polite" aria-atomic="true"
                    data-delay="5000">
                    <div class="toast-body bg-light text-success">
                        <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div>
            <!--end of show toast -->
        </div>
    </div>  
</asp:Content>

