using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace MythicalToyMachine.Data;

public partial class PostgresContext : DbContext
{
    public PostgresContext()
    {
    }

    public PostgresContext(DbContextOptions<PostgresContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Accessory> Accessories { get; set; }

    public virtual DbSet<Bodypart> Bodyparts { get; set; }

    public virtual DbSet<CartItem> CartItems { get; set; }

    public virtual DbSet<Creature> Creatures { get; set; }

    public virtual DbSet<Customer> Customers { get; set; }

    public virtual DbSet<Kit> Kits { get; set; }

    public virtual DbSet<KitAccessory> KitAccessories { get; set; }

    public virtual DbSet<Request> Requests { get; set; }

    public virtual DbSet<RequestItem> RequestItems { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseNpgsql("Name=ConnectionStrings:db");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .HasPostgresExtension("pg_catalog", "azure")
            .HasPostgresExtension("pg_catalog", "pgaadauth")
            .HasPostgresExtension("pg_cron");

        modelBuilder.Entity<Accessory>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accessory_pkey");

            entity.ToTable("accessory", "toy");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Accessoryname)
                .HasMaxLength(40)
                .HasColumnName("accessoryname");
            entity.Property(e => e.BodypartId).HasColumnName("bodypart_id");
            entity.Property(e => e.Discription)
                .HasMaxLength(40)
                .HasColumnName("discription");
            entity.Property(e => e.Price)
                .HasColumnType("money")
                .HasColumnName("price");

            entity.HasOne(d => d.Bodypart).WithMany(p => p.Accessories)
                .HasForeignKey(d => d.BodypartId)
                .HasConstraintName("accessory_bodypart_id_fkey");
        });

        modelBuilder.Entity<Bodypart>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("bodypart_pkey");

            entity.ToTable("bodypart", "toy");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Partname)
                .HasMaxLength(40)
                .HasColumnName("partname");
        });

        modelBuilder.Entity<CartItem>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("cart_item_pkey");

            entity.ToTable("cart_item", "toy");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CustomerId).HasColumnName("customer_id");
            entity.Property(e => e.KitId).HasColumnName("kit_id");
            entity.Property(e => e.Quantity).HasColumnName("quantity");
            entity.Property(e => e.SaveForLater).HasColumnName("save_for_later");

            entity.HasOne(d => d.Customer).WithMany(p => p.CartItems)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cart_item_customer_id_fkey");

            entity.HasOne(d => d.Kit).WithMany(p => p.CartItems)
                .HasForeignKey(d => d.KitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cart_item_kit_id_fkey");
        });

        modelBuilder.Entity<Creature>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("creature_pkey");

            entity.ToTable("creature", "toy");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Creaturename)
                .HasMaxLength(40)
                .HasColumnName("creaturename");
            entity.Property(e => e.Discription)
                .HasMaxLength(200)
                .HasColumnName("discription");
            entity.Property(e => e.Suggestedprice)
                .HasColumnType("money")
                .HasColumnName("suggestedprice");
        });

        modelBuilder.Entity<Customer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("customer_pkey");

            entity.ToTable("customer", "toy");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Firstname)
                .HasMaxLength(80)
                .HasColumnName("firstname");
            entity.Property(e => e.Surname)
                .HasMaxLength(80)
                .HasColumnName("surname");
            entity.Property(e => e.Useremail)
                .HasMaxLength(120)
                .HasColumnName("useremail");
        });

        modelBuilder.Entity<Kit>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("kit_pkey");

            entity.ToTable("kit", "toy");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreatorId).HasColumnName("creator_id");
            entity.Property(e => e.CreatureId).HasColumnName("creature_id");
            entity.Property(e => e.Kitname)
                .HasMaxLength(40)
                .HasColumnName("kitname");
            entity.Property(e => e.Shoulddisplay).HasColumnName("shoulddisplay");
            entity.Property(e => e.ThumbnailPath)
                .HasMaxLength(200)
                .HasColumnName("thumbnail_path");

            entity.HasOne(d => d.Creator).WithMany(p => p.Kits)
                .HasForeignKey(d => d.CreatorId)
                .HasConstraintName("kit_creator_id_fkey");

            entity.HasOne(d => d.Creature).WithMany(p => p.Kits)
                .HasForeignKey(d => d.CreatureId)
                .HasConstraintName("kit_creature_id_fkey");
        });

        modelBuilder.Entity<KitAccessory>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("kit_accessory_pkey");

            entity.ToTable("kit_accessory", "toy");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.AccId).HasColumnName("acc_id");
            entity.Property(e => e.KitId).HasColumnName("kit_id");
            entity.Property(e => e.Qty).HasColumnName("qty");

            entity.HasOne(d => d.Acc).WithMany(p => p.KitAccessories)
                .HasForeignKey(d => d.AccId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("kit_accessory_acc_id_fkey");

            entity.HasOne(d => d.Kit).WithMany(p => p.KitAccessories)
                .HasForeignKey(d => d.KitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("kit_accessory_kit_id_fkey");
        });

        modelBuilder.Entity<Request>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("request_pkey");

            entity.ToTable("request", "toy");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CustomerId).HasColumnName("customer_id");
            entity.Property(e => e.Requestdate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("requestdate");

            entity.HasOne(d => d.Customer).WithMany(p => p.Requests)
                .HasForeignKey(d => d.CustomerId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("request_customer_id_fkey");
        });

        modelBuilder.Entity<RequestItem>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("request_items_pkey");

            entity.ToTable("request_items", "toy");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.KitId).HasColumnName("kit_id");
            entity.Property(e => e.Quantity).HasColumnName("quantity");
            entity.Property(e => e.RequestId).HasColumnName("request_id");
            entity.Property(e => e.RequestPrice)
                .HasColumnType("money")
                .HasColumnName("request_price");

            entity.HasOne(d => d.Kit).WithMany(p => p.RequestItems)
                .HasForeignKey(d => d.KitId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("request_items_kit_id_fkey");

            entity.HasOne(d => d.Request).WithMany(p => p.RequestItems)
                .HasForeignKey(d => d.RequestId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("request_items_request_id_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
