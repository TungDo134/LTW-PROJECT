package entity;

public class AboutUsPic {
    public int aboutUsID;
    public String img1;
    public String img2;
    public String img3;
    public String img4;
    public String member1;
    public String member2;
    public String member3;

    public AboutUsPic(int aboutUsID, String img1, String img2, String img3, String img4, String member1, String member2, String member3) {
        this.aboutUsID = aboutUsID;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
        this.member1 = member1;
        this.member2 = member2;
        this.member3 = member3;
    }
    public AboutUsPic(){

    }

    public int getAboutUsID() {
        return aboutUsID;
    }

    public String getImg1() {
        return img1;
    }

    public String getImg2() {
        return img2;
    }

    public String getImg3() {
        return img3;
    }

    public String getImg4() {
        return img4;
    }

    public String getMember1() {
        return member1;
    }

    public String getMember2() {
        return member2;
    }

    public String getMember3() {
        return member3;
    }

    @Override
    public String toString() {
        return "AboutUsPic{" +
                "aboutUsID=" + aboutUsID +
                ", img1='" + img1 + '\'' +
                ", img2='" + img2 + '\'' +
                ", img3='" + img3 + '\'' +
                ", img4='" + img4 + '\'' +
                ", member1='" + member1 + '\'' +
                ", member2='" + member2 + '\'' +
                ", member3='" + member3 + '\'' +
                '}';
    }
}
