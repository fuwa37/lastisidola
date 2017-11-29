package controllers

import (
"github.com/astaxie/beego"
"lasti/models"
"log"
_ "github.com/go-sql-driver/mysql"
"database/sql"
"time"
"fmt"
)

type MainController struct {
	beego.Controller
}

type HomeController struct {
	beego.Controller
}

type LaptopController struct {
	beego.Controller
}

type RegController struct {
	beego.Controller
}

type LoginController struct {
	beego.Controller
}

type ChatController struct {
	beego.Controller
}

type CatController struct {
	beego.Controller
}

type FAQController struct {
	beego.Controller
}

type FormController struct {
	beego.Controller
}

type TanyaController struct {
	beego.Controller
}

type CartController struct {
	beego.Controller
}

type BayarController struct {
	beego.Controller
}

func (c *MainController) Get() {
	c.TplName = "index.tpl"
}

func (c *FAQController) Get() {
	c.TplName = "faq.tpl"
}

func (c *BayarController) Get() {
	session := c.StartSession()
	userID := session.Get("userID")
	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola?charset=utf8&parseTime=True")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	ca:=models.Tcart{}
	tc:=models.Dcart{}
	
	rows, err:=db.Query("select katalog.merk,katalog.tipe,form.qty,form.harga,beli.garansi,beli.status from beli join form on form.ID=beli.ID_form and form.ID_user=? join katalog on katalog.id=form.ID_barang",userID)

	if err !=nil {
		log.Fatal(err)
	}
	defer rows.Close()
	for rows.Next(){
		err:=rows.Scan(&ca.Merk,&ca.Tipe,&ca.Qty,&ca.Harga,&ca.Garansi,&ca.Status)
		if err !=nil {
			log.Fatal(err)
		}
		if (ca.Status=="pembayaran") {
			tc=append(tc,ca)
		}
	}
	if err!=nil{
		log.Fatal(err)
	}
	err=rows.Err()

	c.Data["json"]=&tc

	c.TplName = "bayar.tpl"
}

func (c *BayarController) Post() {
	session := c.StartSession()
	userID := session.Get("userID")
	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola?charset=utf8&parseTime=True")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	var i int
	err = db.QueryRow("select ID from beli where beli.ID_form=(SELECT ID from form where ID_user=?)",userID).Scan(&i)

	stmt, err := db.Prepare("update beli set status=? where ID=? and status=?")
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	_, err = stmt.Exec("verifikasi",i,"pembayaran")
	if err != nil {

		log.Fatal(err)
	}

	file, header, err := c.GetFile("file") // where <<this>> is the controller and <<file>> the id of your form field
	if file != nil {
        // get the filename
		fileName := header.Filename
		log.Println(fileName)
        // save to server
		c.SaveToFile("file", "C:/Go/project/src/lasti/"+fmt.Sprint(i)+"_"+fmt.Sprint(userID)+"_"+fmt.Sprint(fileName))
	} else {
		c.Redirect("/cart",302)
	}

	c.TplName = "berhasil.tpl"
}

func (c *FormController) Prepare() {
	session := c.StartSession()
	userID := session.Get("userID")
	if userID != nil {
	} else {
		c.Redirect("/login",302)
	}
}

func (c *FormController) Get() {
	var(
		id string
		qty int
		sum int
		)
	session := c.StartSession()
	userID := session.Get("userID")
	log.Println(userID)
	if userID != nil {
		// User is logged in already, display another page
		db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola?charset=utf8&parseTime=True")
		if err != nil {
			log.Fatal(err)
		}
		defer db.Close()

	//log.Println(userID)
		err = db.QueryRow("select ID_barang,qty,harga from form where ID_user=? and status=?", userID,"harga").Scan(&id,&qty,&sum)

	//log.Println(id)
		c.Data["ID"]=&id
		c.Data["qty"]=&qty
		c.Data["harga"]=&sum
		c.TplName = "form.tpl"

	}
}

func (c *FormController) Post() {
	var (
		id int
		idb string
		qty int
		sum int
		)
	session := c.StartSession()
	userID := session.Get("userID")
	if userID != nil {
		db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola?charset=utf8&parseTime=True")
		if err != nil {
			log.Fatal(err)
		}
		defer db.Close()

		stmt, err := db.Prepare("update form set status=?, tgl_klr=? where ID_user=? and status<>?")
		if err != nil {
			log.Fatal(err)
		}
		defer stmt.Close()

		t:=time.Now().Format("2006-01-02 15:04:05")
		t2:=time.Now().AddDate(0,3,0).Format("2006-01-02 15:04:05")
		_, err = stmt.Exec("beli",t,userID,"beli")
		if err != nil {
			log.Fatal(err)
		}

		err = db.QueryRow("select ID, ID_barang, qty,harga from form where ID_user=?", userID).Scan(&id,&idb,&qty,&sum)
		c.Data["qty"]=&qty
		c.Data["id"]=&idb
		c.Data["sum"]=&sum
		i:=float32(sum)/float32(qty)
		c.Data["data"]=&i

		stmt, err = db.Prepare("INSERT beli set ID_form=?, garansi=?, status=?")
		if err != nil {
			log.Fatal(err)
		}
		defer stmt.Close()

		log.Println(t)
		_, err = stmt.Exec(id,t2,"pembayaran")
		if err != nil {

			log.Fatal(err)
		}

		c.Layout = "berhasilbeli.tpl"
		c.TplName = "invoice.tpl"
		// User is logged in already, display another page
		
	}
}

func (c *TanyaController) Prepare() {
	session := c.StartSession()
	userID := session.Get("userID")
	if userID != nil {
	} else {
		c.Redirect("/login",302)
	}
}

func (c *TanyaController) Get() {
	session := c.StartSession()
	userID := session.Get("userID")
	if userID != nil {
		c.TplName = "tanya.tpl"
		// User is logged in already, display another page
		
	}
}

func (c *TanyaController) Post() {
	session := c.StartSession()
	userID := session.Get("userID")
	if userID != nil {
		a:=models.Tuser{}
		//log.Println(c.GetString("name"))
		if err := c.ParseForm(&a); err != nil {
		}

		db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola?charset=utf8&parseTime=True")
		if err != nil {
			log.Fatal(err)
		}
		defer db.Close()

		stmt, err := db.Prepare("INSERT form SET ID_barang=?,ID_user=?,qty=?,tgl_msk=?,status=?")
		if err != nil {
			log.Fatal(err)
		}
		defer stmt.Close()
		t:=time.Now().Format("2006-01-02 15:04:05")

		_, err = stmt.Exec(c.GetString("ID"),userID,c.GetString("qty"),t,"tanya")
		if err != nil {
			log.Fatal(err)
		}

		c.TplName = "berhasil.tpl"
		// User is logged in already, display another page
		
	}
	
}

func (c *CartController) Get() {
	session := c.StartSession()
	userID := session.Get("userID")
	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola?charset=utf8&parseTime=True")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	

	ca:=models.Tcart{}
	tc:=models.Dcart{}
	
	rows, err:=db.Query("select katalog.merk,katalog.tipe,form.qty,form.harga,beli.garansi,beli.status from beli join form on form.ID=beli.ID_form and form.ID_user=? join katalog on katalog.id=form.ID_barang",userID)

	if err !=nil {
		log.Fatal(err)
	}
	defer rows.Close()
	for rows.Next(){
		err:=rows.Scan(&ca.Merk,&ca.Tipe,&ca.Qty,&ca.Harga,&ca.Garansi,&ca.Status)
		if err !=nil {
			log.Fatal(err)
		}
		tc=append(tc,ca)
	}
	if err!=nil{
		log.Fatal(err)
	}
	err=rows.Err()

	c.Data["json"]=&tc
	c.TplName = "cart.tpl"
}

func (c *CartController) Post() {
	session := c.StartSession()
	userID := session.Get("userID")
	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola?charset=utf8&parseTime=True")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	stmt, err := db.Prepare("INSERT ticket SET ID_beli=?,status=?,deskripsi=?")
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	var i int
	err = db.QueryRow("select ID from beli where beli.ID_form=(SELECT ID from form where ID_user=?)",userID).Scan(&i)

	_, err = stmt.Exec(i,"request",c.GetString("ticket"))
	if err != nil {
		log.Fatal(err)
	}
	c.TplName = "berhasil.tpl"
}

func (c *ChatController) Get() {
	c.TplName = "chat.tpl"
}

func (c *HomeController) Get() {
	c.TplName = "home.tpl"
}

func (c *CatController) Get() {
	c.TplName = "katalog.tpl"
}

func (c *RegController) Get () {
	c.TplName ="reg.tpl"
}

func (c *RegController) Post () {
	a:=models.Tuser{}
	//log.Println(c.GetString("name"))
	if err := c.ParseForm(&a); err != nil {
	}

	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola?charset=utf8&parseTime=True")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	stmt, err := db.Prepare("INSERT akun SET user=?,email=?,tlp=?,pass=?")
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	_, err = stmt.Exec(c.GetString("name"),c.GetString("email"),c.GetString("telepon"), c.GetString("password"))
	if err != nil {
		log.Fatal(err)
	}

	c.Redirect("/home",302)
}

func (c *LoginController) Get () {
	c.TplName ="login.tpl"
}

func (c *LoginController) Post () {
	
	var i int
	a:=models.Tuser{}
	//log.Println(c.GetString("name"))
	if err := c.ParseForm(&a); err != nil {
	}

	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola?charset=utf8&parseTime=True")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	err = db.QueryRow("select id from akun where email=? and pass=?", c.GetString("email"),c.GetString("password")).Scan(&i)
	//log.Println(i)
	if (i!=0){
		// Check if user is logged in
		session := c.StartSession()
		userID := session.Get("userID")
		if userID != nil {
		// User is logged in already, display another page
			c.TplName ="home.tpl"
		}

		// Do input checks

		// Set the UserID if everything is ok
		session.Set("userID",i)
		//userID = session.Get(c.GetString("email"))
		//log.Println(userID)
		c.Redirect("/home",302)
	} else {
		c.Redirect("/login",302)
	}
	
}

func (c *LaptopController) Get() {
	l:=models.Tlaptop{}
	dlaptop:=models.Dlaptop{}

	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola?charset=utf8&parseTime=True")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	
	rows, err:=db.Query("select id, merk, tipe, deskripsi, gambar from katalog where jenis='Laptop'")
	
	if err !=nil {
		log.Fatal(err)
	}
	defer rows.Close()
	for rows.Next(){
		err:=rows.Scan(&l.ID,&l.Merk,&l.Tipe,&l.Desc,&l.Img)
		if err !=nil {
			log.Fatal(err)
		}
		dlaptop=append(dlaptop,l)
	}
	if err!=nil{
		log.Fatal(err)
	}
	err=rows.Err()
	//fmt.Println(l.Tipe)
	c.Data["json"]=&dlaptop
	//c.ServeJSON()
	c.TplName = "laptop.tpl"
}
