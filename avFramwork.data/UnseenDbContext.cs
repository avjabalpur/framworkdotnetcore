using Microsoft.EntityFrameworkCore;
using System;
using avFramworktalents.models;

namespace avFramworktalents.data
{
    public class avFramworkDbContext :  DbContext
    {
        public DbSet<Users> Users { get; set; }

        public DbSet<UserSessions> UserSessions { get; set; }

        public DbSet<UserRole> UserRoles { get; set; }

        public DbSet<EventType> EventType { get; set; }

        public DbSet<EventRounds> EventRounds { get; set; }

        public DbSet<Events> Events { get; set; }

        public DbSet<GroupEvent> GroupEvent { get; set; }

        public DbSet<GrantedTokens> GrantedTokens { get; set; }

        public DbSet<Token> Token { get; set; }

        public DbSet<PaymentTransaction> PaymentTransaction { get; set; }

        public DbSet<Managetoken> Managetoken { get; set; }

        public DbSet<Video> Video { get; set; }

        public DbSet<MaskingType> MaskingType { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
           // optionsBuilder.UseSqlServer(@"Server=.;Database=avFramwork;Trusted_Connection=True;");

            optionsBuilder.UseSqlServer(@"Server=166.62.100.228;Database=avFramwork;User ID=avFramwork_nav;Password=Nc2iz%19");

        }

        public avFramworkDbContext(DbContextOptions options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder mb)
        {
            mb.Entity<Users>()
                .Property(x => x.EncrptPassword)
                .HasColumnName("Password");

            mb.Entity<UserSessions>()
                .HasKey(x => x.SessionId);

            mb.Entity<UserRole>()
               .HasKey(x => x.Id);

            mb.Entity<EventType>()
              .HasKey(x => x.Id);

            mb.Entity<Events>()
              .HasKey(x => x.Id);

            mb.Entity<EventRounds>()
              .HasKey(x => x.Id);

            mb.Entity<GroupEvent>()
              .HasKey(x => x.Id);

            mb.Entity<GrantedTokens>()
             .HasKey(x => x.Id);

            mb.Entity<Token>()
           .HasKey(x => x.Id);

            mb.Entity<PaymentTransaction>()
         .HasKey(x => x.Id);

            mb.Entity<Managetoken>()
         .HasKey(x => x.Id);

            mb.Entity<Video>()
        .HasKey(x => x.Id);

            mb.Entity<MaskingType>()
        .HasKey(x => x.Id);
        }

    }
}
