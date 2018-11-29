using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using unseentalents.auth;
using unseentalents.core;
using unseentalents.data;
using unseentalents.services;

namespace unseentalents.web
{
    public class Startup
    {
        readonly string _version = Assembly.GetExecutingAssembly().GetCustomAttribute<AssemblyInformationalVersionAttribute>().InformationalVersion;

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
            Console.WriteLine($"Version {_version}");
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.Configure<ApplicationOptions>(Configuration.GetSection("ConnectionStrings"));
            services.Configure<CookiePolicyOptions>(options =>
            {
                // This lambda determines whether user consent for non-essential cookies is needed for a given request.
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            services.AddEntityFrameworkSqlServer();

            services.AddDbContext<UnseenDbContext>(options =>
            {
                var connectionStringBuilder = new global::System.Data.SqlClient.SqlConnectionStringBuilder();

                connectionStringBuilder.InitialCatalog = Configuration["ConnectionStrings:Default:DBNAME"];
                connectionStringBuilder.DataSource = Configuration["ConnectionStrings:Default:DBHOST"];
                connectionStringBuilder.UserID = Configuration["ConnectionStrings:Default:DBUSER"];
                connectionStringBuilder.Password = Configuration["ConnectionStrings:Default:DBPASS"];

                connectionStringBuilder.MinPoolSize = 5;
                connectionStringBuilder.Pooling = true;
                connectionStringBuilder.ConnectTimeout = 5;

                options.UseSqlServer(connectionStringBuilder.ToString());

            });


            services.AddSession(options =>
            {
                // Set a short timeout for easy testing.
                options.IdleTimeout = TimeSpan.FromSeconds(1800);
                options.Cookie.HttpOnly = true;
            });

            // services.reg
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);

            services.AddTransient<IAuthContext, AuthContext>();
            services.AddTransient<IAccountService, AccountService>();
            services.AddTransient<IEventService, EventService>();
            services.AddTransient<IVideoService, VideoService>();
            services.AddTransient<ITokensService, TokensService>();
            services.AddTransient<IUserService, UserService>();
            services.AddHttpContextAccessor();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseCookiePolicy();
            app.UseSession();

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                 name: "areas",
                 template: "{area:exists}/{controller=Dashboard}/{action=Index}/{id?}"
               );

                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}
