using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;


/// <summary>
/// Summary description for ActionClass
/// </summary>
public class ActionClass
{
    SqlConnection con;
    public ActionClass()
    {
        ConnectionClass cs = new ConnectionClass();
        cs.connect();
        con = new SqlConnection(cs.conn);
    }
    //Select
    public DataSet Read(string textQuery, SqlParameter[] param = null)
    {
        SqlCommand cmd = new SqlCommand(textQuery, con);
        cmd.CommandType = CommandType.Text;
        if (param != null)
            cmd.Parameters.AddRange(param.ToArray());
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        con.Open();
        da.Fill(ds);
        con.Close();
        return ds;
    }
    public DataTable ReadDT(string StoredProcedure, SqlParameter[] param = null)
    {
       
            using (SqlCommand cmd = new SqlCommand(StoredProcedure, con))
            {
                cmd.CommandType = CommandType.Text;
                if (param != null)
                    cmd.Parameters.AddRange(param.ToArray());
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable ds = new DataTable();
                con.Open();
                da.Fill(ds);
                con.Close();
                return ds;
            }
        
    }
         //Edit Update Delete
         public bool Write(string textQuery, SqlParameter[] param = null)
         {
             SqlCommand cmd = new SqlCommand(textQuery, con);
             cmd.CommandType = CommandType.Text;
             if (param != null)
             cmd.Parameters.AddRange(param.ToArray());
             con.Open();
             int rows = cmd.ExecuteNonQuery();
             con.Close();
             if (rows >0)
                 return true;
             else
                 return false;
         }
         //Select
         public DataSet ReadUsingStoredProcedure(string StoredProcedure, SqlParameter[] param = null)
         {
             SqlCommand cmd = new SqlCommand(StoredProcedure, con);
             cmd.CommandType = CommandType.StoredProcedure;
             if (param != null)
                 cmd.Parameters.AddRange(param.ToArray());
             SqlDataAdapter da = new SqlDataAdapter(cmd);
             DataSet ds = new DataSet();
             con.Open();
             da.Fill(ds);
             con.Close();
             return ds;
         }
         //Edit Update Delete
         public bool WriteUsingStoredProcedure(string StoredProcedure, SqlParameter[] param = null)
         {
             SqlCommand cmd = new SqlCommand(StoredProcedure, con);
             cmd.CommandType = CommandType.StoredProcedure;
             if (param != null)
                 cmd.Parameters.AddRange(param.ToArray());
             con.Open();
             int rows = cmd.ExecuteNonQuery();
             con.Close();
             if (rows>0)
                 return true;
             else
                 return false;
         }

         public string WriteNotSP(string StoredProcedure, SqlParameter[] param = null)
         {
             SqlCommand cmd = new SqlCommand(StoredProcedure, con);
             cmd.CommandType = CommandType.Text;
             if (param != null)
                 cmd.Parameters.AddRange(param.ToArray());
             con.Open();
            // int rows = cmd.ExecuteNonQuery();
             int rows = (int)cmd.ExecuteScalar();
             if (con.State ==ConnectionState.Open) 
             con.Close();
             if (rows > 0)
                 return Convert.ToString(rows);
             else
                 return "0";
         }

         public string GetWriteNotSP(string StoredProcedure, SqlParameter[] param = null)
         {

             SqlCommand cmd = new SqlCommand(StoredProcedure, con);
             cmd.CommandType = CommandType.Text;
             if (param != null)
                 cmd.Parameters.AddRange(param.ToArray());
             con.Open();
             int rows = cmd.ExecuteNonQuery();
             con.Close();
             if (rows > 0)
                 return Convert.ToString((int)cmd.ExecuteScalar());
             else
                 return "0";
         }
	
}