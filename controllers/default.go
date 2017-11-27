package controllers

import (
	"github.com/astaxie/beego"
	"lasti/models"
	"fmt"
	"log"
	_ "github.com/go-sql-driver/mysql"
	"database/sql"
)

type MainController struct {
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

func (c *MainController) Get() {
	c.TplName = "index.tpl"
}

func (c *RegController) Get () {
	c.TplName ="reg.tpl"
}

func (c *RegController) Post () {
	a:=models.Tuser{}
	//log.Println(c.GetString("name"))
	if err := c.ParseForm(&a); err != nil {
    }
    
    db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	stmt, err := db.Prepare("INSERT akun SET user=?,email=?,pass=?")
	if err != nil {
		log.Fatal(err)
	}
	defer stmt.Close()

	_, err = stmt.Exec(c.GetString("name"),c.GetString("email"),c.GetString("password"))
	if err != nil {
		log.Fatal(err)
	}

    c.TplName ="index.tpl"
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
    
    db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	err = db.QueryRow("SELECT EXISTS(select * from akun where email=? and pass=?)", c.GetString("email"),c.GetString("password")).Scan(&i)
	log.Println(i)
	if (i==1){
		c.TplName ="home.tpl"
		} else {
			c.TplName="reg.tpl"
		}
	
}

func (c *LaptopController) Get() {
	l:=models.Tlaptop{}
	dlaptop:=models.Dlaptop{}

	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	
	rows, err:=db.Query("select merk, tipe, deskripsi, gambar from katalog where jenis='Laptop'")
	
	if err !=nil {
		log.Fatal(err)
	}
	defer rows.Close()
	for rows.Next(){
		err:=rows.Scan(&l.Merk,&l.Tipe,&l.Desc,&l.Img)
		if err !=nil {
			log.Fatal(err)
		}
		dlaptop=append(dlaptop,l)
	}
	if err!=nil{
		log.Fatal(err)
	}
	err=rows.Err()
	fmt.Println(l.Tipe)
	c.Data["json"]=&dlaptop
	//c.ServeJSON()
	c.TplName = "laptop.tpl"
}
