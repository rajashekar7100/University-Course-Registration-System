package servelet;

import static com.oracle.jrockit.jfr.ContentType.Bytes;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.sql.*;
import java.util.ArrayList;
import sun.misc.IOUtils;

public class DataBaseConnection {

    static Connection conn = null;
    static ResultSet rs = null;
    static Statement st = null;

    public DataBaseConnection() throws SQLException
    {
        getConnection();
    }
    
    public  ArrayList<Object> professorInformation(String query) {
         ArrayList<Object> al = new ArrayList<Object>();
         CoursesRegistered courses=null;
        try {
            rs = st.executeQuery(query);

            while (rs.next()) {

                al.add(rs.getInt(1));
                al.add(rs.getString(2));
                al.add(rs.getString(4));
               
                
            }
            conn.close();
            st.close();
        } catch (Exception e) {
            System.out.println("Exception occured while getting prof information: " + e);
        }
        return al;
    }
    
    public  ArrayList<Object> studentInformation(String query) {
         ArrayList<Object> al = new ArrayList<Object>();
         CoursesRegistered courses=null;
        try {
            rs = st.executeQuery(query);

            while (rs.next()) {

                al.add(rs.getInt(1));
                al.add(rs.getString(2));
                al.add(rs.getString(4));
                if(rs.getObject(5)!=null)
                {
                byte[] st = (byte[]) rs.getObject(5);
                 ByteArrayInputStream baip = new ByteArrayInputStream(st);
      ObjectInputStream ois = new ObjectInputStream(baip);
       courses= (CoursesRegistered) ois.readObject();
                al.add(courses);
                }
                else
                {
                courses=new CoursesRegistered();
               
                al.add(courses);}
                al.add(rs.getInt(6));
                
            }
            conn.close();
            st.close();
        } catch (Exception e) {
            System.out.println("Exception occured while establishing connection: " + e);
        }
        return al;
    }
    
    public String getCourseName(String query)
    {
        String courseName="";
         try
        {
            
            rs=st.executeQuery(query);
            
            while(rs.next())
            {
               
                courseName=rs.getString(1)+"&"+rs.getString(2);
            }
            rs.close();
            conn.close();
        }
        catch(Exception e)
        {
            System.out.println("Exception occured while getting course information: "+e);
        }
         System.out.println("GET COURSE NAME: "+courseName);
       return courseName;
    
    
    }
    
    
    
    public ResultSet getCourseInformation(String query)
    {
        try
        {
            rs=st.executeQuery(query);
            
           // conn.close();
        }
        catch(Exception e)
        {
            System.out.println("Exception occured while getting course information: "+e);
        }
        
       return rs;
    }
    
    
    public int getCreditHours(String query)
    {
        int credit=0;
        try
        {
            rs=st.executeQuery(query);
            while(rs.next())
            {
            
            credit=rs.getInt(1);
            }
            rs.close();
            conn.close();
        }
        catch(Exception e)
        {
            System.out.println("Exception occured while getting course information: "+e);
        }
        
       return credit;
    }
    
    
    
    public  ArrayList<Object> userInformation(String query) {
         ArrayList<Object> al = new ArrayList<Object>();
        try {
            rs = st.executeQuery(query);

            while (rs.next()) {

                al.add(rs.getInt(1));
                al.add(rs.getString(4));
                al.add(rs.getString(2));
                al.add(rs.getString(3));
                al.add(rs.getString(6));
                
                System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(6));
                
            }
            conn.close();
            st.close();
        } catch (Exception e) {
            System.out.println("Exception occured while establishing connection: " + e);
        }
        return al;
    }

    public  void getConnection() throws SQLException {
        try {
           
            //query="select courses from professors where Professor_id=8911";
            String url = "jdbc:mysql://localhost:3306/university";

            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, "raj1", "");

            st = conn.createStatement();

        } catch (Exception e) {
            conn.close();
            st.close();
            System.out.println("Exception occurec while establishing connection to database: " + e);
        }
      
    }
    
    public void commonUpdateQuery(String query)
    {
        try
        {
         st = conn.createStatement();

            st.executeUpdate(query);

            conn.close();
            st.close();
        }
        catch(Exception e)
        {
           System.out.println("Exception occured while inserting user information: "+e);
        }
    
    
    }

    public   void insertQuery(CoursesRegistered courses,int totalCreditHours,int uid) throws IOException {
        
         PreparedStatement pstmt = null;
// now you can use the blob...
        // query="insert into students values (3456,'robert','robertclick@gmail.com','"+bArray+"')";
        String url = "jdbc:mysql://localhost:3306/university";
        try {
           //"INSERT INTO PROFESSORS (Professor_id,Professor_name,Professor_email,courses,CrHrsUndertook)
            pstmt = conn
                    .prepareStatement("update students  set courses=?,CrHrsRegistered=? where uid=?");

        //                pstmt.setBinaryStream(4, );
            Blob customObject = null;

            CoursesRegistered obj=courses;
           /* int totalCreditHours=0;
            for(int i=0;i<courseList.size();i++)
            {
                
                String token[]=(courseList.get(i)).split("&");
                System.out.println("DURING INSERTION: "+token[0]+" "+token[1]);
             obj.courses.add(token[0]);
             totalCreditHours=totalCreditHours+Integer.parseInt(token[1]);
            }*/
            Object customObjectdata = courses;

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream objOstream = new ObjectOutputStream(baos);
            objOstream.writeObject(customObjectdata);

            objOstream.flush();
            objOstream.close();
            byte[] bArray = baos.toByteArray();
            

            ObjectInputStream ois = null;
            ByteArrayInputStream baip = null;
            ByteArrayInputStream bais = new ByteArrayInputStream(bArray);
            pstmt.setBinaryStream(1, bais, bArray.length);
            pstmt.setInt(2, totalCreditHours);
            pstmt.setInt(3, uid);
           

            st = conn.createStatement();

            pstmt.executeUpdate();

            conn.close();
            st.close();
        } catch (Exception e) {

            System.out.println("Exception occur while inserting course updates: " + e);
        }

    }
    
    
     public   void updateDropCoursesQuery(CoursesRegistered courses,int totalCreditHours,int uid) throws IOException {
        
         PreparedStatement pstmt = null;
// now you can use the blob...
        // query="insert into students values (3456,'robert','robertclick@gmail.com','"+bArray+"')";
        String url = "jdbc:mysql://localhost:3306/university";
        try {
           //"INSERT INTO PROFESSORS (Professor_id,Professor_name,Professor_email,courses,CrHrsUndertook)
            pstmt = conn
                    .prepareStatement("update students  set courses=?,CrHrsRegistered=? where uid=?");

        //                pstmt.setBinaryStream(4, );
            Blob customObject = null;

            CoursesRegistered obj=courses;
           /* int totalCreditHours=0;
            for(int i=0;i<courseList.size();i++)
            {
                
                String token[]=(courseList.get(i)).split("&");
                System.out.println("DURING INSERTION: "+token[0]+" "+token[1]);
             obj.courses.add(token[0]);
             totalCreditHours=totalCreditHours+Integer.parseInt(token[1]);
            }*/
            Object customObjectdata = courses;

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ObjectOutputStream objOstream = new ObjectOutputStream(baos);
            objOstream.writeObject(customObjectdata);

            objOstream.flush();
            objOstream.close();
            byte[] bArray = baos.toByteArray();
            

            ObjectInputStream ois = null;
            ByteArrayInputStream baip = null;
            ByteArrayInputStream bais = new ByteArrayInputStream(bArray);
            pstmt.setBinaryStream(1, bais, bArray.length);
            pstmt.setInt(2, totalCreditHours);
            pstmt.setInt(3, uid);
           

            st = conn.createStatement();

            pstmt.executeUpdate();

            conn.close();
            st.close();
        } catch (Exception e) {

            System.out.println("Exception occur while inserting course updates: " + e);
        }

    }
    

    public static void main(String args[]) throws IOException, SQLException {
        //getConnection("");
        new DataBaseConnection();
//        insertQuery(null);
    }

}
