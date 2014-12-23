package pkg;

import java.sql.*;
import java.util.ArrayList;

import sun.font.CreatedFontTracker;

public class javadb {
	

	public static Connection con;
	
	//constructor for loading drivers
	public static Connection getConn(){
		Connection con=null;
		try {
			//loading the driver class.
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// Created the connection 
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@192.168.1.20:1521:xe",
					"nivesh","nivesh");
			
		} catch (Exception e) {
			System.out.println("***********Connection --- ERROR:"+e.toString());
		}
		return con;
	}

    public static boolean activateAdmin(String userId,String admin_status,Connection con) 
	{
			
		try
		{	
			PreparedStatement stmt=con.prepareStatement("update userTable set admin_status='"+admin_status+"' where userId='"+userId+"'");
			int i=stmt.executeUpdate();
			if(i!=0) 
			{
					System.out.println("Admin updated");
					return true;
			}
			else
			{
				System.out.println("not updated");
			}
		}
			catch(Exception e) {
				System.out.println("User delete" +e);
		}
			return false;
	}
	public static boolean AddUser( user_bean obj,Connection con  ){
		
		try {
			CallableStatement cs = con.prepareCall("{call insert_user(?,?,?,?,?,?,?,?,?,?)}");
			cs.setString(1,obj.getId()); 
			cs.setString(2,obj.getName() ); 
			cs.setString(3, obj.getPassword()); 
			cs.setString(4, obj.getDob());
			cs.setString(5,obj.getEmailId()); 
			cs.setString(6,obj.getPhoneNo());
			cs.setString(7,obj.getCompany()); 
			cs.setString(8,obj.getAddress());
			cs.setString(9,obj.getUserType());
			cs.setString(10,obj.getUname());
			
			System.out.println("UserName"+obj.getUname());
			
			
			int i = cs.executeUpdate();
			
			// i returns the number of rows inserted/updated in the database
			if (i!=0) {
				System.out.println("Inserted");
				return true;
			} else {
				System.out.println("Not inserted");
			}
		} catch (Exception e) {
			System.out.println("javadb-addUser"+e.toString());
		}
		
		
		return false;
	}

	public static user_bean login_User(String userName,String password,Connection con){
		user_bean obj = null;
		ResultSet rs =null;
		
		try {
			
			PreparedStatement ps = con.prepareStatement(
					"Select * from usertable where uName=? and PASSWORD=?",
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			ps.setString(1, userName);
			ps.setString(2, password);
			
			 rs =  ps.executeQuery();
			
			
			
			if (rs.next()) {
				obj =new user_bean();
				obj.setId(rs.getString(1));
				obj.setName(rs.getString(2));
				obj.setPassword(rs.getString(3));
				obj.setDob(rs.getString(4));
				obj.setEmailId(rs.getString(5));
				obj.setPhoneNo(rs.getString(6));
				obj.setCompany(rs.getString(7));
				obj.setAddress(rs.getString(8));
				obj.setUserType(rs.getString(9));
				obj.setRegistrationDate(rs.getString(10));
				obj.setLastLogin(rs.getString(11));
				obj.setAdmin_status(rs.getString(12));
				obj.setUname(userName);
				
				
				return obj;
			} 			
			
		} catch (Exception e) {
			System.out.println("Error in userdata");
		}
		return obj;
	
	}
	
    public static String getId(String c, String table) {
        System.out.println("It generating Id");
        String id = c;
        try {
                        int max = 0;
                        Connection con = getConn();
                        Statement st = con.createStatement();
                        ResultSet res = st.executeQuery("select count(*) from " + table);
                        if (res.next()) {
                        	
                                        max = res.getInt(1);
                        }
                        if (max >= 0 && max < 10) {
                                        id = id + "00" + (max + 1);
                        } else if (max >= 10 && max < 100) {
                                        id = id + "0" + (max + 1);
                        } else if (max >= 100 && max < 1000) {
                                        id = id + "" + (max + 1);
                        }
                        con.close();
        } catch (Exception e) {
                        e.printStackTrace();
        }
        
        return id;
}
    
    public static ArrayList<user_bean> getUsers(Connection conn,String company,String userType) 
    {
     ArrayList<user_bean> al=null;
   	 boolean flag = false;
   	 try 
   	 {
   		String sql="";
   		 if(company!=null){
   			System.out.println("****Company "+company);
   	   		
   			sql="select * from userTable where company='"+company+"' and userType='"+userType+"'";
			 System.out.println(sql);
   		 }
   		 else{
   			sql="select * from userTable where userType='"+userType+"'";
   			
   		 }
 	
   		 Statement st = conn.createStatement();
   		ResultSet 	rs=st.executeQuery(sql);
			while(rs.next())
			{
				if(!flag){
					al=new ArrayList<user_bean>();
					flag=true;
				}
				System.out.println("inside");
				user_bean objBean=new user_bean();
				objBean.setId(rs.getString(1));
				objBean.setName(rs.getString(2));					
				objBean.setPassword(rs.getString(3));
				objBean.setDob(rs.getString(4));
				objBean.setEmailId(rs.getString(5));
				objBean.setPhoneNo(rs.getString(6));
				objBean.setCompany(rs.getString(7));
				objBean.setAddress(rs.getString(8));
				objBean.setUserType(rs.getString(9));
				objBean.setRegistrationDate(rs.getString(10));
				objBean.setLastLogin(rs.getString(11));
				objBean.setAdmin_status(rs.getString(12));				
				objBean.setUname(rs.getString(13));				
				
				al.add(objBean);
			}
		 } 
    	 catch (SQLException e) 
	 	 {
			System.out.println("Error getting user" + e.toString());
		 }

   	 return al;
    }
    
    

	public static ArrayList<user_bean> getAdmins(Connection conn,String userType) 
     {
    	 ArrayList<user_bean> al=new ArrayList<user_bean>();
    	 ResultSet rs=null;
    	 try 
    	 {
			PreparedStatement ps=conn.prepareStatement("select * from userTable where userType='"+userType+"'");
			rs=ps.executeQuery();
			while(rs.next())
			{
				user_bean objBean=new user_bean();
				objBean.setId(rs.getString(1));
				objBean.setName(rs.getString(2));					
				objBean.setPassword(rs.getString(3));
				objBean.setDob(rs.getString(4));
				objBean.setEmailId(rs.getString(5));
				objBean.setPhoneNo(rs.getString(6));
				objBean.setCompany(rs.getString(7));
				objBean.setAddress(rs.getString(8));
				objBean.setUserType(rs.getString(9));
				objBean.setRegistrationDate(rs.getString(10));
				objBean.setAdmin_status(rs.getString(12));
				objBean.setUname(rs.getString(13));
				
				//System.out.println(objBean.getQuestion());
				al.add(objBean);
			}
		 } 
     	 catch (SQLException e) 
	 	 {
			e.printStackTrace();
		 }

    	 return al;
     }
	
	public static user_bean viewProfile(String userId,Connection con)
	{
		user_bean obj=new user_bean();	
		try{			
		PreparedStatement ps=con.prepareStatement("select * from userTable where userId='"+userId+"'");
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			obj.setId(rs.getString(1));
			obj.setName(rs.getString(2));
			obj.setPassword(rs.getString(3));
			obj.setDob(rs.getString(4));
			obj.setEmailId(rs.getString(5));
			obj.setPhoneNo(rs.getString(6));
			obj.setCompany(rs.getString(7));
			obj.setAddress(rs.getString(8));
			obj.setUserType(rs.getString(9));
			obj.setRegistrationDate(rs.getString(10));
			obj.setLastLogin(rs.getString(11));
			}
		}catch (Exception e) {
		System.out.println("*** view" + e.toString());
		}
		
		return obj;
	
	}
    
    
    public static ArrayList<topic_bean> getTopic(String company) {
    	 
    	ArrayList<topic_bean> al = new ArrayList<topic_bean>();
        String sql = "select * from topicTable where company='"+company+"'";
       
        try {
                        Connection con = getConn();
                        Statement st = con.createStatement();
                        ResultSet res = st.executeQuery(sql);
                        
                        while (res.next()){
                        	  
                        	 topic_bean obj_topic = new topic_bean();
                        	 
                        	 obj_topic.setTopicId(res.getString("topicId"));
                        	 obj_topic.setUserId( res.getString("userId"));
                    		 obj_topic.setCompany(res.getString("company"));
                    		 obj_topic.setDescription(res.getString("description"));
                    		 obj_topic.setTopicName(res.getString("topicName"));
                    		 
                    		 
                            al.add(obj_topic);
                             	
                        }
                        con.close();
        } catch (Exception e) {
        	System.out.println("Error:" + e.toString());
        }
       
        return al;
}
    
    public static ArrayList<level_bean> getLevel(String topicId) {
    	System.out.println("0");
    	ArrayList<level_bean> al = new ArrayList<level_bean>();
        String sql = "select * from levelTable where topicId='"+topicId+"'";
        try {
        	System.out.println("1");
                        Connection con = getConn();
                        Statement st = con.createStatement();
                        ResultSet res = st.executeQuery(sql);
                        
                        while (res.next()){
                        	System.out.println("2");
                        	level_bean obj_level = new level_bean();
                        	 
                        	obj_level.setLevelId(res.getString("levelId"));
                   		 	obj_level.setLevelType(res.getString("levelType"));
                   		 	obj_level.setTopicId(topicId);
                   		  
                    		 
                            al.add(obj_level);
                             	
                        }
                        con.close();
                    	System.out.println("3");
        } catch (Exception e) {
        	System.out.println("4");
        	System.out.println("Get_level Error:" + e.toString());
        }
       
        return al;
}
    
	public static ArrayList<question_bean> getQuestion(String topicId,String levelId) 
    {
		
   	 ArrayList<question_bean> al=new ArrayList<question_bean>();
   	 ResultSet rs=null;
   	 try 
   	 {
   	  Connection con = getConn();
			PreparedStatement ps=con.prepareStatement("select * from questionTable where topicId='"+topicId+"' and levelId='"+levelId+"'");
			rs=ps.executeQuery();
			while(rs.next())
			{
				question_bean objBean=new question_bean();
				
				objBean.setLevelId(levelId);					
				objBean.setTopicId(topicId);								
				objBean.setQuestion(rs.getString(3));					
				objBean.setAns(rs.getString(4));
				objBean.setOpt_a(rs.getString(5));
				objBean.setOpt_b(rs.getString(6));
				objBean.setOpt_c(rs.getString(7));
				objBean.setOpt_d(rs.getString(8));
				objBean.setQuesId(rs.getString(9));
				
				
				al.add(objBean);
			}
			
			 con.close();
		 } 
    	 catch (SQLException e) 
	 	 {
			e.printStackTrace();
		 }

   	 return al;
    }
    
    public static ArrayList<String> getAllData(String str) {
                    ArrayList<String> al = new ArrayList<String>();
                    String sql = "";
                    if (str.equals("unactive")) {
                                    sql = "select accno from account where status='unactive'";
                    } else if (str.equals("active")) {
                                    sql = "select accno from account where status='active'";
                    } else {
                                    sql = "select accno from account";
                    }
                    try {
                                    Connection con = getConn();
                                    Statement st = con.createStatement();
                                    ResultSet res = st.executeQuery(sql);
                                    while (res.next())
                                                    al.add(res.getString(1));
                                    con.close();
                    } catch (Exception e) {
                    }
                    return al;
    }

    public static ArrayList<assessment_bean> getAssessment(Connection conn,String userId) 
    {
   	 ArrayList<assessment_bean> al=new ArrayList<assessment_bean>();
   	 ResultSet rs=null;
   	 try 
   	 {
			PreparedStatement ps=conn.prepareStatement("select * from assessmentTable where userId=?");
			ps.setString(1,userId);
			rs=ps.executeQuery();
			while(rs.next())
			{
				assessment_bean objBean=new assessment_bean();
				objBean.setUserId(rs.getString(1));
				objBean.setAssessmentId(rs.getString(2));
				objBean.setTopicName(rs.getString(3));					
				objBean.setExamDate(rs.getString(4));
				objBean.setLevelType(rs.getString(5));
				objBean.setScore(rs.getInt(6));
				objBean.setResult(rs.getString(7));
				//System.out.println(objBean.getQuestion());
				al.add(objBean);
			}
		 } 
    	 catch (SQLException e) 
	 	 {
			e.printStackTrace();
		 }

   	 return al;
    }
    	
    public static String validateLogin(String loginid, String password) {
                    String logintype = "";
                    try {
                                    Connection con = getConn();
                                    Statement st = con.createStatement();
                                    ResultSet res = st
                                                                    .executeQuery("select loginid,password,logintype from login where loginid='"
                                                                                                    + loginid
                                                                                                    + "' and password='"
                                                                                                    + password
                                                                                                    + "' and status='active'");
                                    if (res.next()) {
                                                    if (loginid.equals(res.getString(1))
                                                                                    && password.equals(res.getString(2)))
                                                                    logintype = res.getString(3).trim();
                                    }
                    } catch (Exception e) {
                                    e.printStackTrace();
                    }
                    return logintype;
    }

    
    public static boolean addTopic(topic_bean obj_topic, level_bean obj_level, Connection con)
	 {
    	System.out.println("add topic function()");
    	int i=0,j=0;
    	
		try 
		{
			
		 
			PreparedStatement cs1=con.prepareStatement("INSERT INTO topicTable VALUES(?,?,?,?,?)");  
			//System.out.println(obj_topic.getTopicId()+obj_topic.getUserId()+obj_topic.getTopicName()+obj_topic.getDescription()+obj_topic.getCompany());
			cs1.setString(1,obj_topic.getTopicId()); 
			cs1.setString(2,obj_topic.getUserId());
			cs1.setString(3,obj_topic.getTopicName()); 
			cs1.setString(4,obj_topic.getDescription());
			cs1.setString(5,obj_topic.getCompany());
			
			System.out.println("topic insterted 1");
			
			PreparedStatement cs2=con.prepareStatement("INSERT INTO levelTable VALUES(?,?,?)");  
			cs2.setString(1,obj_level.getLevelId()); 
			cs2.setString(2,obj_topic.getTopicId()); 
			cs2.setString(3,obj_level.getLevelType()); 
			System.out.println(obj_topic.getTopicId());
			System.out.println("topic insterted 2");
			i=cs1.executeUpdate();
			System.out.println("topic insterted 3");
			j=cs2.executeUpdate();
			 
			
			
			if(i!=0 && j!=0)
			{
				System.out.println("Topic inserted");
				return true;
		 	}
			else
			{
			 
				System.out.println("Topic Not Inserted");
				return false;
			}
			
			
		} catch (Exception e) 
		{
			System.out.println("*******javaDb-ADD_Topic" +e.toString());
		}
		 return false;
	 }
	 
    public static boolean add_level(level_bean obj_level,Connection con)
	{
		boolean b = false;
		System.out.println("1");
		 
			try{
				System.out.println("2");
				 
				
				PreparedStatement cs2=con.prepareStatement("INSERT INTO levelTable VALUES(?,?,?)");  
				cs2.setString(1,obj_level.getLevelId()); 
				cs2.setString(2,obj_level.getTopicId()); 
				cs2.setString(3,obj_level.getLevelType()); 	
			 
			int i=cs2.executeUpdate();
			if(i!=0)
			{
				System.out.println("3");
				 
				b=true;
				
			}
			 
			}catch(Exception e)
			{
				
			System.out.println("********Error adding new level"+e.toString());
			}
			return b;
		}

    public static boolean addTestDetails(assessment_bean obj, Connection con)
	 {
    	int i=0;
   	
		try 
		{
			
		 
			CallableStatement cs1=con.prepareCall("{call insert_assessment(?,?,?,?,?,?)}");  
		 	cs1.setString(1,obj.getUserId()); 
			cs1.setString(2,obj.getAssessmentId());
			cs1.setString(3,obj.getTopicName()); 
			cs1.setString(4,obj.getLevelType());
			cs1.setInt(5,obj.getScore());
			cs1.setString(6,obj.getResult());
			
			i = cs1.executeUpdate();
			 
			if(i!=0)
			{
				System.out.println("Assessment inserted");
				return true;
		 	}
			else
			{
			 
				System.out.println("Assessment Not Inserted");
				return false;
			}
			
			
		} catch (Exception e) 
		{
			System.out.println("*******javaDb-ADD_Assessment" +e.toString());
		}
		 return false;
	 } 
    public static boolean addQuestion(question_bean obj, Connection con){
    	
     
 		try 
 		{
 			CallableStatement cs1=con.prepareCall("{call insert_question(?,?,?,?,?,?,?,?,?)}");  
 			cs1.setString(1,obj.getLevelId()); 
 			cs1.setString(2,obj.getTopicId()); 
 			cs1.setString(3,obj.getQuestion());
 			cs1.setString(4,obj.getAns());
 			
 			cs1.setString(5,obj.getOpt_a()); 
 			cs1.setString(6,obj.getOpt_b()); 
 			cs1.setString(7,obj.getOpt_c());
 			cs1.setString(8,obj.getOpt_d());
 			cs1.setString(9,obj.getQuesId());
 			
 			int i=cs1.executeUpdate();

 			if(i!=0)
 			{
 			 
 				System.out.println("Question Inserted");
 				return true;
 			}
 			else
 			{
 				System.out.println(" Question Not Inserted");
 				return false;
 			}
 			
 			
 		} catch (Exception e) 
 		{
 			System.out.println("**********javaDB-add_Question " +e.toString());
 		}
    	return false;
    	
    }

    public static boolean updateLastLogin(Connection con, String userId)
	{
		try{
		PreparedStatement ps=con.prepareStatement("update userTable set lastLogin=sysdate  where userId=?");
		ps.setString(1,userId);
		 
		int i=ps.executeUpdate();
		if(i!=0)
		{
			return true;
		}
		}catch(Exception e)
		{
			
			e.printStackTrace();
		}
		return false;
	}
    
    
	public static boolean updateProfile(Connection con,user_bean obj)
	{
		try{
		PreparedStatement ps=con.prepareStatement("update userTable set userName=?,company=?,phoneNo=?,address=?  where userId=?");
		ps.setString(1,obj.getName());
		ps.setString(2,obj.getCompany());
		ps.setString(3,obj.getPhoneNo());
		ps.setString(4,obj.getAddress());
		ps.setString(5,obj.getId());
		int i=ps.executeUpdate();
		if(i!=0)
		{
			return true;
		}
		}catch(Exception e)
		{
			
			e.printStackTrace();
		}
		return false;
	}
	public static boolean deleteUser(String userId,Connection con) 
	{
		
		try{
		
		con.setAutoCommit(false);
		Statement statement = null;

		
		    statement = con.createStatement();

		    statement.addBatch("delete from assessmentTable where userId='"+userId+"'");
		    statement.addBatch("delete from topicTable where userId='"+userId+"'");
		    statement.addBatch("delete from userTable where userId='"+userId+"'");

		    int[] i = statement.executeBatch();
		    
		    if(i[2]!=0){
		    	con.commit();
		    	System.out.println("User deleted");
		    	return true;
		    }else{
		    	con.rollback();
		    }
		} catch(Exception e) {
			System.out.println("User delete" +e);
		}
		return false;
	}	

	
	public static boolean deleteTopic(String topicId,Connection con) 
	{
		
		try{
		
		con.setAutoCommit(false);
		Statement statement = null;

		
		    statement = con.createStatement();

		    statement.addBatch("delete from questionTable where topicId='"+topicId+"'");
		    statement.addBatch("delete from levelTable where topicId='"+topicId+"'");
		    statement.addBatch("delete from topicTable where topicId='"+topicId+"'");

		    int[] i = statement.executeBatch();
		    
		    if(i[2]!=0){
		    	con.commit();
		    	System.out.println("Topic deleted");
		    	return true;
		    }else{
		    	con.rollback();

				return false;
		    }
		} catch(Exception e) {
			
			System.out.println("deleteTopic" +e);
		}
		 
		 
		return false;
	}	
	public static boolean delete_level(String topicId,String levelId, Connection con) {
		int i,j;
		try{
			Statement st2 = con.createStatement();
			j=st2.executeUpdate("Delete from questionTable where topicId='"+topicId+"' and levelId='"+levelId+"'");
			
			Statement st = con.createStatement();
			i=st.executeUpdate("Delete from levelTable where topicId='"+topicId+"' and levelId='"+levelId+"'");
			
			
			
			if (i!=0&&j!=0) {
				System.out.println("Level Deleted");
				return true;
			} else {
				System.out.println("Level not Deleted");
				
				return false;
			}
		}catch (Exception e) {
			System.out.println("***********Error Deleting topic- JavaDB.java" + e.toString());
		}
		
		
		return false;
		
	}
	
    public static boolean deleteAdmin(Connection con,String userId) 
	{
			
		try
		{	
			CallableStatement stmt=con.prepareCall("{call delete_admin(?)}"); 
			stmt.setString(1,userId);
		    int i=stmt.executeUpdate();
			if(i!=0) 
			{
					System.out.println("Admin deleted");
					return true;
			}
			}
			catch(Exception e) {
				System.out.println("User delete" +e);
		}
			return false;
	}	
	
    public static java.sql.Date getCDate() {
                    java.util.Date today = new java.util.Date();
                    return new java.sql.Date(today.getTime());
    }


	public static void main(String[] args) {
		 
	}

}
