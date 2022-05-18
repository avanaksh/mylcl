using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ConnectionClass
/// </summary>
public class ConnectionClass
{
    public string conn;
	public ConnectionClass()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void connect()
    {
        conn = System.Configuration.ConfigurationManager.ConnectionStrings["pgsConnectionStringL"].ConnectionString.ToString();
     }
}