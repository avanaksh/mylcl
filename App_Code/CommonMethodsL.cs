using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for CommonMethods
/// </summary>
public class CommonMethodsL
{
    ConnectionClass cs = new ConnectionClass();
   
    public CommonMethodsL()
    {
        cs.connect();
        //
        // TODO: Add constructor logic here
        //
    }
    //public string GetinstituteIdByAcronym(string acronym)
    //{
    //    DataSet ds = new DataSet();
    //    ds = GetDataByQuery("select inst_Id from posting_place where acronym = '"+ acronym + "'  ");

    //    return ds.Tables[0].Rows[0]["inst_Id"].ToString();
    //}

    // This GetEnrollmentYear Method required two parameters StartingYear and Ending year
    // It return a List of Integer Years as per the given parameters.
    // For Example
    // Calling the with its parameters => GetEnrollmentYear(2010,2020);
    // Output=> {2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020}
    public List<int> GetEnrollmentYear(int startYear, int EndYear)
    {
        List<int> lstYears = new List<int>();
        for (int i = startYear; i <= EndYear; i++)
        {
            lstYears.Add(i);
        }

        return lstYears;
    }

    // This GetAcadmicyears Method required two parameters StartingYear and EndingYear
    // It return a List of Integer Years as per the given parameters.
    // For Example
    // Calling the with its parameters => GetAcadmicyears(2010,2020);
    // Output => {2010-11,2011-12,2012-13,2013-14,2014-15,2015-16,2016-17,2017-18,2018-19,2019-20,2020-21}
    public List<string> GetAcadmicyears(int startYear, int EndYear)
    {
        List<int> lstYears = new List<int>();
        List<string> lstAcdYear = new List<string>();
        for (int i = startYear; i <= EndYear; i++)
        {
            lstYears.Add(i);
        }

        foreach (int year in lstYears)
        {
            lstAcdYear.Add(year.ToString() + "-" + (year + 1).ToString().Substring(2, 2));
        }
        return lstAcdYear;
    }


    
    // It return a DataSet object as per the given parameters.
    //public DataSet GetColleges()
    //{
    //    return GetDataByQuery("Select acronym,inst_Id from [posting_place]");
    //}

  
    //public DataSet GetqryStudents(string whereConditions, SqlParameter[] param = null)
    //{
    //    return GetDataByQuery("Select * from [qryStudent] where 1 = 1 " + whereConditions,param);
    //}

    
    //public DataSet GetqryCourses(string whereConditions, SqlParameter[] param = null)
    //{
    //    return GetDataByQuery("Select * from [qry_Course] where 1 = 1 " + whereConditions, param);
    //}

    
    //public DataSet GetqryGeneralCourseOffered(string whereConditions, SqlParameter[] param = null)
    //{
    //    return GetDataByQuery("Select * from [qry_GeneralCourseOffered] where 1 = 1 " + whereConditions, param);
    //}

    //public DataSet GetqryStudentRegisteredCourse(string whereConditions, SqlParameter[] param = null)
    //{
    //    return GetDataByQuery("Select * from [qryStudentRegisteredCourse] where 1 = 1 " + whereConditions, param);
    //}

    
    //public DataSet GetqryStudentPPW(string whereConditions, SqlParameter[] param = null)
    //{
    //    return GetDataByQuery("Select * from [qryStudentPPW] where 1 = 1 " + whereConditions, param);
    //}

    
    //public DataSet GetqryFaculty(string whereConditions, SqlParameter[] param = null)
    //{
    //    return GetDataByQuery("Select * from [qryFaculty] where 1 = 1 " + whereConditions,param);
    //}

    public DataSet GetDataByQuery(string Query, SqlParameter[] param = null)
    {
        
       // Connection con = new Connection();
        DataSet ds = new DataSet();
        SqlCommand cmd = new SqlCommand(Query, new SqlConnection(cs.conn));

        if (param != null)
            cmd.Parameters.AddRange(param.ToArray());

        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            da.Fill(ds);
        }

        return ds;
    }
    public SqlDataReader GetDataReaderByQuery(string Query, SqlParameter[] param = null)
    {
       // Connection con = new Connection();

        SqlConnection cn = new SqlConnection(cs.conn);


        SqlCommand cmd = new SqlCommand(Query, new SqlConnection(cs.conn));
        cn.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        //if (param != null)
        //    cmd.Parameters.AddRange(param.ToArray());

        //using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //{
        //    da.Fill(ds);
        //}

        return rdr;
    }


    public DataTable GetDataTableByQuery(string Query, SqlParameter[] param = null)
    {
        //Connection con = new Connection();
        DataTable dt = new DataTable();
        SqlCommand cmd = new SqlCommand(Query, new SqlConnection(cs.conn));

        if (param != null)
            cmd.Parameters.AddRange(param.ToArray());

        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            da.Fill(dt);
        }
        return dt;
    }

    //This method for semester 
    public List<string> GetSemester()
    {
        List<string> lstSemester = new List<string>();

        lstSemester.Add("I");
        lstSemester.Add("II");

        return lstSemester;
    }
    // This MessageBox Method required two parameters [ Message String and this keyword]
    // It prompts a JavaScript Alert on the current page instance.
    public void MessageBox(string msz, System.Web.UI.Page page)
    {
        ScriptManager.RegisterClientScriptBlock(page, this.GetType(), "alertMessage", "alert('" + msz + "')", true);
        //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+msz+"')", true);
    }


    public SqlDataReader ExecuteReader(String connectionString, String commandText, CommandType commandType, params SqlParameter[] parameters)
    {
        SqlConnection conn = new SqlConnection(connectionString);

        using (SqlCommand cmd = new SqlCommand(commandText, conn))
        {
            cmd.CommandType = commandType;
            if (parameters != null)
                cmd.Parameters.AddRange(parameters);

            conn.Open();
            // When using CommandBehavior.CloseConnection, the connection will be closed when the   
            // IDataReader is closed.  
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            return reader;
        }

    }

    public SqlDataReader ExecuteReadern(String connectionString, String commandText)
    {
        SqlConnection conn = new SqlConnection(connectionString);

        using (SqlCommand cmd = new SqlCommand(commandText, conn))
        {
            cmd.CommandType = CommandType.Text;
           

            conn.Open();
            // When using CommandBehavior.CloseConnection, the connection will be closed when the   
            // IDataReader is closed.  
            SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.CloseConnection);

            return reader;
        }

    }


}