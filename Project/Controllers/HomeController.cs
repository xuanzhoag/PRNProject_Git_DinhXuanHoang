using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Project.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

namespace Project.Controllers
{
    public class HomeController : Controller
    {
        PRN211Context context = new PRN211Context();
        public IActionResult Index()
        {

            var view = View();
            if (HttpContext.Session.GetString("account") != null)
            {
                String studentID = HttpContext.Session.GetString("account");
                String studentName = context.Students.ToList<Student>().Find(x => x.StudentId == studentID).Name;
                ViewBag.studentID = studentID;
                ViewBag.studentName = studentName;
                view = View("Views/Index.cshtml");
            }
            else
            {
                view = View("Views/Login.cshtml");
            }
            return view;
        }

        public IActionResult Login(String email, String password)
        {

            Student s = context.Students.ToList<Student>().Find(x => x.Email.Equals(email)
            && x.Password.Equals(password));
            if (s == null)
            {
                ViewBag.loginFail = true;
            }
            else
            {
                HttpContext.Session.SetString("account", s.StudentId);
                HttpContext.Session.SetString("name", s.Name);
            }
            return Index();
        }
        public IActionResult Logout()
        {


            HttpContext.Session.Clear();

            return View("Views/Login.cshtml");
        }

        public IActionResult Transcript()
        {


            var view = View();
            if (HttpContext.Session.GetString("account") != null)
            {
                String studentID = HttpContext.Session.GetString("account");
                String studentName = context.Students.ToList<Student>().Find(x => x.StudentId == studentID).Name;
                ViewBag.studentID = studentID;
                ViewBag.studentName = studentName;

                ViewData.Model = context.Transcripts.ToList<Transcript>().
                    FindAll(x => x.StudentId == studentID);
                view = View("Views/AcademicTranscript.cshtml");
            }
            else
            {
                view = View("Views/Login.cshtml");
            }
            return view;
        }



        public IActionResult MarkReport(int termID, int CourseID)
        {

            var view = View();
            if (HttpContext.Session.GetString("account") != null)
            {
                String studentID = HttpContext.Session.GetString("account");
                ViewBag.studentID = studentID;
                String studentName = HttpContext.Session.GetString("name");
                ViewBag.studentName = studentName;
                List<TermStudent> termStus = context.TermStudents.
                    Include(x => x.Term).ToList<TermStudent>().
                    FindAll(x => x.StudentId == studentID);


                List<Term> terms = new List<Term>();
                foreach (TermStudent t in termStus)
                {
                    terms.Add(t.Term);
                }
                termID = (termID == 0) ? terms[0].TermId : termID;
                ViewBag.termID = new MultiSelectList(terms, "TermId", "TermName");


                List<Course> courses = context.Courses.ToList<Course>().FindAll(x => x.StudentId == studentID &&
                 Convert.ToInt32(x.TermId) == termID);



                CourseID = (CourseID == 0) ? courses[0].CourseId : CourseID;
                ViewBag.CourseID = new MultiSelectList(courses, "CourseId", "SubjectName");
                ViewData.Model = context.Marks.ToList<Mark>().FindAll(x => x.CourseId == CourseID);


                view = View("Views/MarkReport.cshtml");




            }
            else
            {
                view = View("Views/Login.cshtml");
            }
            return view;
        }



    }
}
