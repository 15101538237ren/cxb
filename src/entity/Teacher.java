package entity;



/**
 * Teacher entity. @author MyEclipse Persistence Tools
 */

public class Teacher  implements java.io.Serializable {


    // Fields    

     private String TId;
     private String TXm;
     private String TEmail;
     private String TSjh;
     private String TDescription;


    // Constructors

    /** default constructor */
    public Teacher() {
    }

	/** minimal constructor */
    public Teacher(String TXm) {
        this.TXm = TXm;
    }
    
    /** full constructor */
    public Teacher(String TXm, String TEmail, String TSjh, String TDescription) {
        this.TXm = TXm;
        this.TEmail = TEmail;
        this.TSjh = TSjh;
        this.TDescription = TDescription;
    }

   
    // Property accessors

    public String getTId() {
        return this.TId;
    }
    
    public void setTId(String TId) {
        this.TId = TId;
    }

    public String getTXm() {
        return this.TXm;
    }
    
    public void setTXm(String TXm) {
        this.TXm = TXm;
    }

    public String getTEmail() {
        return this.TEmail;
    }
    
    public void setTEmail(String TEmail) {
        this.TEmail = TEmail;
    }

    public String getTSjh() {
        return this.TSjh;
    }
    
    public void setTSjh(String TSjh) {
        this.TSjh = TSjh;
    }

    public String getTDescription() {
        return this.TDescription;
    }
    
    public void setTDescription(String TDescription) {
        this.TDescription = TDescription;
    }
   








}