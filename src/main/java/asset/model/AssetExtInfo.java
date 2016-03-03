package asset.model;

// Generated 2016-2-28 13:52:10 by Hibernate Tools 3.4.0.CR1

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * AssetExtInfo generated by hbm2java
 */
@Entity
@Table(name = "asset_ext_info", catalog = "asset")
public class AssetExtInfo implements java.io.Serializable {

	private Integer assetExtId;
	private int assetId;
	private int assetAttrId;
	private String assetAttrValue;
	private Byte assetStatus;
	private Date assetAddTime;
	private String assetAddUser;
	private Date assetModifyTime;
	private String assetModifyUser;

	public AssetExtInfo() {
	}

	public AssetExtInfo(int assetId, int assetAttrId) {
		this.assetId = assetId;
		this.assetAttrId = assetAttrId;
	}

	public AssetExtInfo(int assetId, int assetAttrId, String assetAttrValue,
			Byte assetStatus, Date assetAddTime, String assetAddUser,
			Date assetModifyTime, String assetModifyUser) {
		this.assetId = assetId;
		this.assetAttrId = assetAttrId;
		this.assetAttrValue = assetAttrValue;
		this.assetStatus = assetStatus;
		this.assetAddTime = assetAddTime;
		this.assetAddUser = assetAddUser;
		this.assetModifyTime = assetModifyTime;
		this.assetModifyUser = assetModifyUser;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "asset_ext_id", unique = true, nullable = false)
	public Integer getAssetExtId() {
		return this.assetExtId;
	}

	public void setAssetExtId(Integer assetExtId) {
		this.assetExtId = assetExtId;
	}

	@Column(name = "asset_id", nullable = false)
	public int getAssetId() {
		return this.assetId;
	}

	public void setAssetId(int assetId) {
		this.assetId = assetId;
	}

	@Column(name = "asset_attr_id", nullable = false)
	public int getAssetAttrId() {
		return this.assetAttrId;
	}

	public void setAssetAttrId(int assetAttrId) {
		this.assetAttrId = assetAttrId;
	}

	@Column(name = "asset_attr_value")
	public String getAssetAttrValue() {
		return this.assetAttrValue;
	}

	public void setAssetAttrValue(String assetAttrValue) {
		this.assetAttrValue = assetAttrValue;
	}

	@Column(name = "asset_status")
	public Byte getAssetStatus() {
		return this.assetStatus;
	}

	public void setAssetStatus(Byte assetStatus) {
		this.assetStatus = assetStatus;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "asset_add_time", length = 19)
	public Date getAssetAddTime() {
		return this.assetAddTime;
	}

	public void setAssetAddTime(Date assetAddTime) {
		this.assetAddTime = assetAddTime;
	}

	@Column(name = "asset_add_user", length = 11)
	public String getAssetAddUser() {
		return this.assetAddUser;
	}

	public void setAssetAddUser(String assetAddUser) {
		this.assetAddUser = assetAddUser;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "asset_modify_time", length = 19)
	public Date getAssetModifyTime() {
		return this.assetModifyTime;
	}

	public void setAssetModifyTime(Date assetModifyTime) {
		this.assetModifyTime = assetModifyTime;
	}

	@Column(name = "asset_modify_user", length = 11)
	public String getAssetModifyUser() {
		return this.assetModifyUser;
	}

	public void setAssetModifyUser(String assetModifyUser) {
		this.assetModifyUser = assetModifyUser;
	}

}
