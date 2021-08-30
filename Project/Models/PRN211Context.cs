using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace Project.Models
{
    public partial class PRN211Context : DbContext
    {
        public PRN211Context()
        {
        }

        public PRN211Context(DbContextOptions<PRN211Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<Mark> Marks { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<Term> Terms { get; set; }
        public virtual DbSet<TermStudent> TermStudents { get; set; }
        public virtual DbSet<Transcript> Transcripts { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("server =(local); database =PRN211;uid=sa;pwd=123456;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<Course>(entity =>
            {
                entity.ToTable("Course");

                entity.Property(e => e.CourseId)
                    .ValueGeneratedNever()
                    .HasColumnName("CourseID");

                entity.Property(e => e.StudentId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("StudentID");

                entity.Property(e => e.SubjectId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("SubjectID");

                entity.Property(e => e.SubjectName)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.TermId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("TermID");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.Courses)
                    .HasForeignKey(d => d.StudentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Course_Student");
            });

            modelBuilder.Entity<Mark>(entity =>
            {
                entity.ToTable("Mark");

                entity.Property(e => e.MarkId)
                    .HasMaxLength(50)
                    .HasColumnName("MarkID");

                entity.Property(e => e.CourseId).HasColumnName("CourseID");

                entity.Property(e => e.MarkName).HasMaxLength(50);

                entity.Property(e => e.MarkType)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.MarkWeight)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Value).HasColumnName("value");

                entity.HasOne(d => d.Course)
                    .WithMany(p => p.Marks)
                    .HasForeignKey(d => d.CourseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Mark_Course");
            });

            modelBuilder.Entity<Student>(entity =>
            {
                entity.ToTable("Student");

                entity.Property(e => e.StudentId)
                    .HasMaxLength(50)
                    .HasColumnName("StudentID");

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Birth).HasColumnType("date");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("email");

                entity.Property(e => e.Name)
                    .HasMaxLength(10)
                    .IsFixedLength(true);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("password");

                entity.Property(e => e.Phone)
                    .HasMaxLength(50)
                    .HasColumnName("phone");
            });

            modelBuilder.Entity<Term>(entity =>
            {
                entity.ToTable("Term");

                entity.Property(e => e.TermId)
                    .ValueGeneratedNever()
                    .HasColumnName("TermID");

                entity.Property(e => e.TermName)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<TermStudent>(entity =>
            {
                entity.HasKey(e => new { e.TermId, e.StudentId });

                entity.ToTable("Term_Student");

                entity.Property(e => e.TermId).HasColumnName("TermID");

                entity.Property(e => e.StudentId)
                    .HasMaxLength(50)
                    .HasColumnName("StudentID");

                entity.HasOne(d => d.Student)
                    .WithMany(p => p.TermStudents)
                    .HasForeignKey(d => d.StudentId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Term_Student_Student");

                entity.HasOne(d => d.Term)
                    .WithMany(p => p.TermStudents)
                    .HasForeignKey(d => d.TermId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Term_Student_Term");
            });

            modelBuilder.Entity<Transcript>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Transcript");

                entity.Property(e => e.Credit).HasColumnName("credit");

                entity.Property(e => e.Grade).HasColumnName("grade");

                entity.Property(e => e.Status)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("status");

                entity.Property(e => e.StudentId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("StudentID");

                entity.Property(e => e.SubjectId)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("subjectID");

                entity.Property(e => e.SubjectName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("subjectName");

                entity.Property(e => e.SubjectPreQuisite)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("subjectPreQuisite");

                entity.Property(e => e.TermId).HasColumnName("termID");

                entity.HasOne(d => d.Term)
                    .WithMany()
                    .HasForeignKey(d => d.TermId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Transcript_Term");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
