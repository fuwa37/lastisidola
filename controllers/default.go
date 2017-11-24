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

func (c *MainController) Get() {
	c.TplName = "index.tpl"
}

func (c *LaptopController) Get() {
	l:=models.Tlaptop{}
	dlaptop:=models.Dlaptop{}

	db, err:=sql.Open("mysql","root:@tcp(127.0.0.1:3306)/sidola")
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()
	
	rows, err:=db.Query("select merk, jenis, deskripsi from laptop")
	
	if err !=nil {
		log.Fatal(err)
	}
	defer rows.Close()
	for rows.Next(){
		err:=rows.Scan(&l.Merk,&l.Jenis,&l.Desc)
		if err !=nil {
			log.Fatal(err)
		}
		dlaptop=append(dlaptop,l)
	}
	if err!=nil{
		log.Fatal(err)
	}
	err=rows.Err()

	fmt.Println()
	c.Data["json"]=&dlaptop
	//c.ServeJSON()
	c.TplName = "laptop.tpl"
}
