package entity;

import java.io.Serializable;

public class HomePicture  implements Serializable {
    public int homeId;
    public String bannerImg;
    public String img1;
    public String img2;
    public String img3;
    public String img4;
    public String img5;
    public String logo;

    public HomePicture(int homeId, String bannerImg, String img1, String img2, String img3, String img4, String img5,String logo) {
        this.homeId = homeId;
        this.bannerImg = bannerImg;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
        this.img5 = img5;
        this.logo = logo;
    }

    public HomePicture() {

    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public void setHomeId(int homeId) {
        this.homeId = homeId;
    }

    public void setBannerImg(String bannerImg) {
        this.bannerImg = bannerImg;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }

    public void setImg5(String img5) {
        this.img5 = img5;
    }

    public int getHomeId() {
        return homeId;
    }

    public String getBannerImg() {
        return bannerImg;
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

    public String getImg5() {
        return img5;
    }

    @Override
    public String toString() {
        return "HomePicture{" +
                "homeId=" + homeId +
                ", bannerImg='" + bannerImg + '\'' +
                ", img1='" + img1 + '\'' +
                ", img2='" + img2 + '\'' +
                ", img3='" + img3 + '\'' +
                ", img4='" + img4 + '\'' +
                ", img5='" + img5 + '\'' +
                '}';
    }
}
