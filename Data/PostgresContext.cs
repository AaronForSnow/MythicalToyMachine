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

    public virtual DbSet<Creature> Creatures { get; set; }

    public virtual DbSet<Kit> Kits { get; set; }

    public virtual DbSet<KitAccessory> KitAccessories { get; set; }

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

        modelBuilder.Entity<Kit>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("kit_pkey");

            entity.ToTable("kit", "toy");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreatureId).HasColumnName("creature_id");
            entity.Property(e => e.Kitname)
                .HasMaxLength(40)
                .HasColumnName("kitname");
            entity.Property(e => e.Shoulddisplay).HasColumnName("shoulddisplay");

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
                .HasConstraintName("kit_accessory_acc_id_fkey");

            entity.HasOne(d => d.Kit).WithMany(p => p.KitAccessories)
                .HasForeignKey(d => d.KitId)
                .HasConstraintName("kit_accessory_kit_id_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
