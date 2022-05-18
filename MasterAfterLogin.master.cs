using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterAfterLogin : System.Web.UI.MasterPage
{
    public Users users;
    protected void Page_Init(object sender, EventArgs e)
    {
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
        Response.Cache.SetNoStore();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (Session["UserObj"] != null)
        {
            users = (Users)Session["UserObj"];
        }
        else
        {

        }
        
    }
    protected void lblogout_OnClick(object sender, EventArgs e)
    {
        HttpContext.Current.Session.Clear();
        HttpContext.Current.Session.Abandon();
        HttpContext.Current.Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
       
        Session["UserObj"] = null;       
        users = null;
        Response.Redirect("~/CPtoMasterPage1.aspx");
    }
}
