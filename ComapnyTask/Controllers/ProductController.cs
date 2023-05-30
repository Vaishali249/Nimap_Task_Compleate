using ComapnyTask.DbContext;
using ComapnyTask.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Diagnostics.Contracts;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ComapnyTask.Controllers
{
	public class ProductController : Controller
	{
		// GET: Product
		public ActionResult Index()
		{
			ViewBag.Category = CategoryList();
			return View();
		}
		public ActionResult PartialView()
		{
			ViewBag.Category = CategoryList();
			return View();
		}
		public List<SelectListItem> CategoryList()
		{
			var itemList = new List<SelectListItem>();
			itemList.Add(new SelectListItem { Value = "0", Text = "--select--" });

			using (DbComapnyTaskEntities db = new DbComapnyTaskEntities())
			{
				var items = (from X in db.Categorytbls

							 select new { X.CategoryId, X.CategoryName }).ToList();

				foreach (var data in items)
				{
					itemList.Add(new SelectListItem { Value = data.CategoryId.ToString(), Text = data.CategoryName.ToString() });

				}
				return itemList;
			}
		}

		public ActionResult DeleteData(int id)
		{
			using (DbComapnyTaskEntities db = new DbComapnyTaskEntities())
			{
				try
				{
					ProductTbl obj = new ProductTbl()
					{
						ProductId = id
					};

					db.Entry(obj).State = EntityState.Deleted;
					db.SaveChanges();
				}
				catch (Exception ex)
				{
					throw ex;
				}


			}
			return RedirectToAction("index");
		}
		public ActionResult EditData(int id)
		{
			ViewBag.Category = CategoryList();
			using (DbComapnyTaskEntities db = new DbComapnyTaskEntities())
			{
				var data = new ProductTbl();
				data = db.ProductTbls.Where(x => x.ProductId == id).FirstOrDefault();
				ProductModel model = new ProductModel()
				{
					ProductId = data.ProductId,
					ProductName = data.ProductName,
					CategoryId = data.CategoryId
				};
				return PartialView("Index", model);
			}
		}
		public ActionResult Report()
		{
			using (DbComapnyTaskEntities db = new DbComapnyTaskEntities())
			{
				return View(db.SpProduct().ToList());
			}
		}
		public ActionResult SaveOrUpdate(ProductModel model)
		{
			try
			{
				using (DbComapnyTaskEntities db = new DbComapnyTaskEntities())
				{
					if (model.ProductId == 0)
					{
						ProductTbl product = new ProductTbl()
						{
							ProductName = model.ProductName,
							CategoryId = model.CategoryId
						};
						db.Entry(product).State = System.Data.Entity.EntityState.Added;
						db.SaveChanges();
					}
					else
					{
						ProductTbl product = new ProductTbl()
						{
							ProductId = model.ProductId,
							ProductName = model.ProductName,
							CategoryId = model.CategoryId
						};
						db.Entry(product).State = System.Data.Entity.EntityState.Modified;
						db.SaveChanges();
					}
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}
			return RedirectToAction("Index");
		}
	}
}