
package Model;

public class User {
    private String id;
    private String nic;
    private String fullname;
    private String address;
    private String nationality;
    
    public User(){
        
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public User(String id, String nic, String fullname, String address, String nationality) {
        this.id = id;
        this.nic = nic;
        this.fullname = fullname;
        this.address = address;
        this.nationality = nationality;
    }
    
    public String getId() {
        return id;
    }

    public String getNic() {
        return nic;
    }

    public String getFullname() {
        return fullname;
    }

    public String getAddress() {
        return address;
    }

    public String getNationality() {
        return nationality;
    }
    
    
}
