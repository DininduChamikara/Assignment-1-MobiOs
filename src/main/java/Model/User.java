
package Model;

public class User {
    private String id;
    private String nic;
    private String fullname;
    private String address;
    private String nationality;

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
