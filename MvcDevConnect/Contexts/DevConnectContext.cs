using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using MvcDevConnect.Models;

namespace MvcDevConnect.Contexts;

public partial class DevConnectContext : DbContext
{
    public DevConnectContext()
    {
    }

    public DevConnectContext(DbContextOptions<DevConnectContext> options)
        : base(options)
    {
    }

    public virtual DbSet<TbComentario> TbComentario { get; set; }

    public virtual DbSet<TbCurtida> TbCurtida { get; set; }

    public virtual DbSet<TbPublicacao> TbPublicacao { get; set; }

    public virtual DbSet<TbUsuario> TbUsuario { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        => optionsBuilder.UseSqlServer("Name=DevCon_SA");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TbComentario>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tb_Comen__3213E83FC01291A6");

            entity.HasOne(d => d.IdPublicacaoNavigation).WithMany(p => p.TbComentario)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_Coment__id_Pu__6FE99F9F");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.TbComentario)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_Coment__id_Us__70DDC3D8");
        });

        modelBuilder.Entity<TbCurtida>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tb_Curti__3213E83FF2F8602D");

            entity.HasOne(d => d.IdPublicacaoNavigation).WithMany(p => p.TbCurtida)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_Curtid__id_Pu__7E37BEF6");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.TbCurtida)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_Curtid__id_Us__7D439ABD");
        });

        modelBuilder.Entity<TbPublicacao>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tb_Publi__3213E83F2CB16D11");

            entity.HasOne(d => d.IdUsuarioNavigation).WithMany(p => p.TbPublicacao).HasConstraintName("FK__tb_Public__id_Us__6D0D32F4");
        });

        modelBuilder.Entity<TbUsuario>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__tb_Usuar__3213E83F176CC507");

            entity.HasMany(d => d.IdUsuarioSeguido).WithMany(p => p.IdUsuarioSeguir)
                .UsingEntity<Dictionary<string, object>>(
                    "TbSeguidor",
                    r => r.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguido")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_Seguid__id_Us__2BFE89A6"),
                    l => l.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguir")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_Seguid__id_Us__2B0A656D"),
                    j =>
                    {
                        j.HasKey("IdUsuarioSeguir", "IdUsuarioSeguido").HasName("PK__tb_Segui__134B0CB3E72220DE");
                        j.ToTable("tb_Seguidor");
                        j.IndexerProperty<int>("IdUsuarioSeguir").HasColumnName("id_Usuario_Seguir");
                        j.IndexerProperty<int>("IdUsuarioSeguido").HasColumnName("id_Usuario_Seguido");
                    });

            entity.HasMany(d => d.IdUsuarioSeguir).WithMany(p => p.IdUsuarioSeguido)
                .UsingEntity<Dictionary<string, object>>(
                    "TbSeguidor",
                    r => r.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguir")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_Seguid__id_Us__2B0A656D"),
                    l => l.HasOne<TbUsuario>().WithMany()
                        .HasForeignKey("IdUsuarioSeguido")
                        .OnDelete(DeleteBehavior.ClientSetNull)
                        .HasConstraintName("FK__tb_Seguid__id_Us__2BFE89A6"),
                    j =>
                    {
                        j.HasKey("IdUsuarioSeguir", "IdUsuarioSeguido").HasName("PK__tb_Segui__134B0CB3E72220DE");
                        j.ToTable("tb_Seguidor");
                        j.IndexerProperty<int>("IdUsuarioSeguir").HasColumnName("id_Usuario_Seguir");
                        j.IndexerProperty<int>("IdUsuarioSeguido").HasColumnName("id_Usuario_Seguido");
                    });
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
