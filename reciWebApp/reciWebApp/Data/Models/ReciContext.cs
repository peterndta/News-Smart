using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
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
        public virtual DbSet<FoodIngredient> FoodIngredients { get; set; } = null!;
        public virtual DbSet<Ingredient> Ingredients { get; set; } = null!;
        public virtual DbSet<Post> Posts { get; set; } = null!;
        public virtual DbSet<PostReport> PostReports { get; set; } = null!;
        public virtual DbSet<RecipeType> RecipeTypes { get; set; } = null!;
        public virtual DbSet<Step> Steps { get; set; } = null!;
        public virtual DbSet<StepsType> StepsTypes { get; set; } = null!;
        public virtual DbSet<Use> Uses { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;
        public virtual DbSet<UserInteract> UserInteracts { get; set; } = null!;
        public virtual DbSet<UsesOfFood> UsesOfFoods { get; set; } = null!;

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
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.Type).HasColumnName("type");
            });

            modelBuilder.Entity<Collection>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.CollectionName).HasColumnName("collection_name");
            });

            modelBuilder.Entity<CookingMethod>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.Method).HasColumnName("method");
            });

            modelBuilder.Entity<FoodCollection>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.CollectionId)
                    .HasMaxLength(50)
                    .HasColumnName("collection_id");

                entity.Property(e => e.PostsId)
                    .HasMaxLength(50)
                    .HasColumnName("posts_id");

                entity.HasOne(d => d.Collection)
                    .WithMany(p => p.FoodCollections)
                    .HasForeignKey(d => d.CollectionId)
                    .HasConstraintName("FK_FoodCollections_Collections");

                entity.HasOne(d => d.Posts)
                    .WithMany(p => p.FoodCollections)
                    .HasForeignKey(d => d.PostsId)
                    .HasConstraintName("FK_FoodCollections_Posts");
            });

            modelBuilder.Entity<FoodIngredient>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.IngredientId)
                    .HasMaxLength(50)
                    .HasColumnName("ingredient_id");

                entity.Property(e => e.Mass).HasColumnName("mass");

                entity.Property(e => e.PostsId)
                    .HasMaxLength(50)
                    .HasColumnName("posts_id");

                entity.HasOne(d => d.Ingredient)
                    .WithMany(p => p.FoodIngredients)
                    .HasForeignKey(d => d.IngredientId)
                    .HasConstraintName("FK_FoodIngredients_Ingredients");

                entity.HasOne(d => d.Posts)
                    .WithMany(p => p.FoodIngredients)
                    .HasForeignKey(d => d.PostsId)
                    .HasConstraintName("FK_FoodIngredients_Posts");
            });

            modelBuilder.Entity<Ingredient>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.CategoryId)
                    .HasMaxLength(50)
                    .HasColumnName("category_id");

                entity.Property(e => e.Name).HasColumnName("name");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Ingredients)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_Ingredients_Categories");
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.CookingMethodId)
                    .HasMaxLength(50)
                    .HasColumnName("cooking_method_id");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("create_date");

                entity.Property(e => e.Name).HasColumnName("name");

                entity.Property(e => e.RecipeTypeId)
                    .HasMaxLength(50)
                    .HasColumnName("recipe_type_id");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.UpdateDate)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("update_date");

                entity.Property(e => e.UserId)
                    .HasMaxLength(50)
                    .HasColumnName("user_id");

                entity.Property(e => e.UsesId)
                    .HasMaxLength(50)
                    .HasColumnName("uses_id");

                entity.HasOne(d => d.CookingMethod)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.CookingMethodId)
                    .HasConstraintName("FK_Posts_CookingMethods");

                entity.HasOne(d => d.RecipeType)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.RecipeTypeId)
                    .HasConstraintName("FK_Posts_RecipeTypes");

                entity.HasOne(d => d.Uses)
                    .WithMany(p => p.Posts)
                    .HasForeignKey(d => d.UsesId)
                    .HasConstraintName("FK_Posts_Users");
            });

            modelBuilder.Entity<PostReport>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.PostsId)
                    .HasMaxLength(50)
                    .HasColumnName("posts_id");

                entity.Property(e => e.Reason).HasColumnName("reason");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.UserId)
                    .HasMaxLength(50)
                    .HasColumnName("user_id");

                entity.HasOne(d => d.Posts)
                    .WithMany(p => p.PostReports)
                    .HasForeignKey(d => d.PostsId)
                    .HasConstraintName("FK_PostReports_Posts");
            });

            modelBuilder.Entity<RecipeType>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.Country).HasColumnName("country");

                entity.Property(e => e.Region).HasColumnName("region");
            });

            modelBuilder.Entity<Step>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.Description).HasColumnName("description");

                entity.Property(e => e.PostsId)
                    .HasMaxLength(50)
                    .HasColumnName("posts_id");

                entity.Property(e => e.StepsTypeId)
                    .HasMaxLength(50)
                    .HasColumnName("steps_type_id");

                entity.Property(e => e.UrlImage).HasColumnName("url_image");

                entity.Property(e => e.UrlVideo).HasColumnName("url_video");

                entity.HasOne(d => d.Posts)
                    .WithMany(p => p.Steps)
                    .HasForeignKey(d => d.PostsId)
                    .HasConstraintName("FK_Steps_Posts");

                entity.HasOne(d => d.StepsType)
                    .WithMany(p => p.Steps)
                    .HasForeignKey(d => d.StepsTypeId)
                    .HasConstraintName("FK_Steps_StepsType");
            });

            modelBuilder.Entity<StepsType>(entity =>
            {
                entity.ToTable("StepsType");

                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.StepsName)
                    .HasMaxLength(50)
                    .HasColumnName("steps_name");
            });

            modelBuilder.Entity<Use>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.UsesOfFood).HasColumnName("uses_of_food");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.BanTime)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("ban_time");

                entity.Property(e => e.Email).HasColumnName("email");

                entity.Property(e => e.Name).HasColumnName("name");
            });

            modelBuilder.Entity<UserInteract>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.Bookmark).HasColumnName("bookmark");

                entity.Property(e => e.CreateDate)
                    .HasColumnType("smalldatetime")
                    .HasColumnName("create_date");

                entity.Property(e => e.PostsId)
                    .HasMaxLength(50)
                    .HasColumnName("posts_id");

                entity.Property(e => e.Rating).HasColumnName("rating");

                entity.Property(e => e.UserId)
                    .HasMaxLength(50)
                    .HasColumnName("user_id");

                entity.HasOne(d => d.Posts)
                    .WithMany(p => p.UserInteracts)
                    .HasForeignKey(d => d.PostsId)
                    .HasConstraintName("FK_UserInteracts_Posts");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.UserInteracts)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK_UserInteracts_Users");
            });

            modelBuilder.Entity<UsesOfFood>(entity =>
            {
                entity.ToTable("UsesOfFood");

                entity.Property(e => e.Id)
                    .HasMaxLength(50)
                    .HasColumnName("id");

                entity.Property(e => e.PostsId)
                    .HasMaxLength(50)
                    .HasColumnName("posts_id");

                entity.Property(e => e.UsesId)
                    .HasMaxLength(50)
                    .HasColumnName("uses_id");

                entity.HasOne(d => d.Posts)
                    .WithMany(p => p.UsesOfFoods)
                    .HasForeignKey(d => d.PostsId)
                    .HasConstraintName("FK_UsesOfFood_Posts");

                entity.HasOne(d => d.Uses)
                    .WithMany(p => p.UsesOfFoods)
                    .HasForeignKey(d => d.UsesId)
                    .HasConstraintName("FK_UsesOfFood_Uses");
            });

            OnModelCreatingPartial(modelBuilder);
        }
        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
