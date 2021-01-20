package com.springsecurity.auth.models;


import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "records")
public class OfficialRecord {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    @Size(min = 1,max = 255)
    private String first_name;

    @NotNull
    @Size(min = 1,max = 255)
    private String last_name;
    @Column(updatable=false)

    @NotNull
    private String address1;

    @NotNull
    private String address2;

    private Date createdAt;
    private Date updatedAt;

    @OneToOne(mappedBy="record", cascade=CascadeType.ALL, fetch=FetchType.LAZY)
    private User user;

    @OneToMany(mappedBy="record", fetch = FetchType.LAZY)
    private List<Test> tests;

    @OneToMany(mappedBy="record", fetch = FetchType.LAZY)
    private List<Location> locations;

    public OfficialRecord() {
    }

    public OfficialRecord(String first_name,String last_name, String address1,String address2) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.address1 = address1;
        this.address2 = address2;
    }

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }

    public List<Location> getLocations() {
        return locations;
    }

    public void setLocations(List<Location> locations) {
        this.locations = locations;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<Test> getTests() {
        return tests;
    }

    public void setTests(List<Test> tests) {
        this.tests = tests;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public String getAddress1() {
        return address1;
    }

    public void setAddress1(String address1) {
        this.address1 = address1;
    }

    public String getAddress2() {
        return address2;
    }

    public void setAddress2(String address2) {
        this.address2 = address2;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
