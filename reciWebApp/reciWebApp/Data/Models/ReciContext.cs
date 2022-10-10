using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace reciWebApp.Data.Models
{
    public partial class ReciContext : DbContext
    {
        public ReciContext()
        {
        }

        public ReciContext(DbContextOptions<ReciContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Category> Categories { get; set; } = null!;
        public virtual DbSet<Collection> Collections { get; set; } = null!;
        public virtual DbSet<CookingMethod> CookingMethods { get; set; } = null!;
        public virtual DbSet<FoodCollection> FoodCollections { get; set; } = null!;
        public virtual DbSet<Post> Posts { get; set; } = null!;
        public virtual DbSet<PostMetum> PostMeta { get; set; } = null!;
        public virtual DbSet<PostReport> PostReports { get; set; } = null!;
        public virtual DbSet<RecipeRegion> RecipeRegions { get; set; } = null!;
        public virtual DbSet<Step> Steps { get; set; } = null!;
        public virtual DbSet<Use> Uses { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserInteract> UserInteracts { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=reci.cnikyqokwrnq.ap-southeast-1.rds.amazonaws.com;Database=Reci;uid=admin;pwd=Swd3922022;Trusted_Connection=False;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Type).HasColumnName("type");
            });

            modelBuilder.Entity<Collection>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CollectionName).HasColumnName("collection_name");
            });

            modelBuilder.Entity<CookingMethod>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Method).HasColumnName("method");
            });

            modelBuilder.Entity<FoodCollection>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CollectionId).HasColumnName("collection_id");

                entity.Property(e => e.PostsId)
                    .HasMaxLength(50)
                    .HasColumnName("posts_id");

                entity.HasOne(d => d.Collection)
                    .WithMany(p => p.FoodCollections)
                    .HasForeignKey(d => d.CollectionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FoodCollections_Collections");

                entity.HasOne(d => d.Posts)
                    .WithMany(p => p.FoodCollections)
                    .HasForeignKey(d => d.PostsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_FoodCollections_Posts");
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.CategoryId).HasColumnName("category_id");

                entity.Property(e => e.CookingMethodId).HasColumnName("cooking_method_id");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("create_date");

                entity.Property(e => e.ImageUrl).HasColumnName("image_url");

                entity.Property(e => e.Name).HasColumnName("name");

                entity.Property(e => e.RecipeRegionId).HasColumnName("recipe_region_id");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.UpdateDate)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("update_date");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.Property(e => e.UsesId).HasColumnName("uses_id");

                entity.Property(e => e.VideoUrl).HasColumnName("video_url");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_Posts_Categories");

                entity.HasOne(d => d.CookingMethod)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.CookingMethodId)
                    .HasConstraintName("FK_Posts_CookingMethods");

                entity.HasOne(d => d.RecipeRegion)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.RecipeRegionId)
                    .HasConstraintName("FK_Posts_RecipeRegions");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_Posts_Users");

                entity.HasOne(d => d.Uses)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.UsesId)
                    .HasConstraintName("FK_Posts_Uses");
            });

            modelBuilder.Entity<PostMetum>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.PostId)
                    .HasMaxLength(50)
                    .HasColumnName("post_id");

                entity.Property(e => e.Reason).HasColumnName("reason");

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.PostMeta)
                    .HasForeignKey(d => d.PostId)
                    .HasConstraintName("FK_PostMeta_Posts");
            });

            modelBuilder.Entity<PostReport>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.PostsId)
                    .HasMaxLength(50)
                    .HasColumnName("posts_id");

                entity.Property(e => e.Reason).HasColumnName("reason");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Posts)
                    .WithMany(p => p.PostReports)
                    .HasForeignKey(d => d.PostsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PostReports_Posts");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.PostReports)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PostReports_Users");
            });

            modelBuilder.Entity<RecipeRegion>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Continents).HasColumnName("continents");
            });

            modelBuilder.Entity<Step>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Cooking).HasColumnName("cooking");

                entity.Property(e => e.CookingTime).HasColumnName("cooking_time");

                entity.Property(e => e.Ingredient).HasColumnName("ingredient");

                entity.Property(e => e.PostsId)
                    .HasMaxLength(50)
                    .HasColumnName("posts_id");

                entity.Property(e => e.PreparingTime).HasColumnName("preparing_time");

                entity.Property(e => e.Processing).HasColumnName("processing");

                entity.Property(e => e.ProcessingTime).HasColumnName("processing_time");

                entity.Property(e => e.Serving).HasColumnName("serving");

                entity.Property(e => e.Tool).HasColumnName("tool");

                entity.HasOne(d => d.Posts)
                    .WithMany(p => p.Steps)
                    .HasForeignKey(d => d.PostsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Steps_Posts");
            });

            modelBuilder.Entity<Use>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.UsesOfFood).HasColumnName("uses_of_food");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.BanTime)
                    .HasColumnType("datetime")
                    .HasColumnName("ban_time");

                entity.Property(e => e.Email).HasColumnName("email");

                entity.Property(e => e.ImageUrl).HasColumnName("image_url");

                entity.Property(e => e.Name).HasColumnName("name");

                entity.Property(e => e.Role)
                    .HasMaxLength(50)
                    .HasColumnName("role");
            });

            modelBuilder.Entity<UserInteract>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Bookmark).HasColumnName("bookmark");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("datetime")
                    .HasColumnName("create_date");

                entity.Property(e => e.PostsId)
                    .HasMaxLength(50)
                    .HasColumnName("posts_id");

                entity.Property(e => e.Rating).HasColumnName("rating");

                entity.Property(e => e.UpdateDate)
                    .HasColumnType("datetime")
                    .HasColumnName("update_date");

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Posts)
                    .WithMany(p => p.UserInteracts)
                    .HasForeignKey(d => d.PostsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserInteracts_Posts");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserInteracts)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UserInteracts_Users");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
