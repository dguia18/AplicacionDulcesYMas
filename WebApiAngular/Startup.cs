using Domain.Contracts;
using Infrastructure;
using Infrastructure.Base;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.SpaServices.AngularCli;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using System;
using WebApi.Authentication;

namespace WebApiAngular
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<DulcesYmasContext>
                (opt => opt.UseSqlServer(@"Server=LAPTOP-GEQ2K9D2\MSSQLSERVER01;Database=DulcesYMas;Trusted_Connection=True;MultipleActiveResultSets=true"));
            var tokenProvider = new JwtProvider("issuer", "audience", "DulcesYMas");
            services.AddSingleton<ITokenProvider>(tokenProvider);
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).
                AddJwtBearer(options =>
                {
                    options.RequireHttpsMetadata = false;
                    options.TokenValidationParameters = tokenProvider.GetValidationParameters();
                });
            services.AddAuthorization(auth =>
            {
                auth.DefaultPolicy = new AuthorizationPolicyBuilder().
                AddAuthenticationSchemes(JwtBearerDefaults.AuthenticationScheme).
                RequireAuthenticatedUser().
                Build();
            });
            //services.AddDbContext<LibranzasContext>
            //   (opt => opt.UseSqlServer(@"Server=LAPTOP-GEQ2K9D2\MSSQLSERVER01;Database=Libranzas;Trusted_Connection=True;MultipleActiveResultSets=true"));
            ///Inyecci�n de dependencia Especifica
            //https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection?view=aspnetcore-3.0#register-additional-services-with-extension-methods
            services.AddScoped<IUnitOfWork, UnitOfWork>(); //Crear Instancia por peticion
            services.AddScoped<IDbContext, DulcesYmasContext>(); //Crear Instancia por peticion

            services.AddControllersWithViews();
            // In production, the Angular files will be served from this directory
            services.AddSpaStaticFiles(configuration =>
            {
                configuration.RootPath = "ClientApp/dist";
            });

			#region SwaggerOpen Api
			//Register the Swagger services
			services.AddSwaggerGen(c =>
			{
				c.SwaggerDoc("v1", new OpenApiInfo
				{
					Version = "v1",
					Title = "Task API",
					Description = "Task API - ASP.NET Core Web API",
					TermsOfService = new Uri("https://cla.dotnetfoundation.org/"),
					Contact = new OpenApiContact
					{
						Name = "Unicesar",
						Email = string.Empty,
						Url = new Uri("https://github.com/borisgr04/CrudNgDotNetCore3"),
					},
					License = new OpenApiLicense
					{
						Name = "Licencia dotnet foundation",
						Url = new Uri("https://www.byasystems.co/license"),
					}
				});
			});

			#endregion
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            if (!env.IsDevelopment())
            {
                app.UseSpaStaticFiles();
            }

            app.UseRouting();

            #region Activar SwaggerUI
            app.UseSwagger();
            app.UseSwaggerUI(
                options =>
                {
                    options.SwaggerEndpoint("/swagger/v1/swagger.json", "Signus Prespuesto v1");
                }
            );
            #endregion

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller}/{action=Index}/{id?}");
            });

            app.UseSpa(spa =>
            {
                // To learn more about options for serving an Angular SPA from ASP.NET Core,
                // see https://go.microsoft.com/fwlink/?linkid=864501

                spa.Options.SourcePath = "ClientApp";

                if (env.IsDevelopment())
                {
                    spa.UseAngularCliServer(npmScript: "start");
                }
            });
        }
    }
}
