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

		public void ConfigureServices(IServiceCollection services)
		{
			var connectionString = Configuration.GetConnectionString("DulcesYmasContext");
			services.AddDbContext<DulcesYmasContext>
				(opt => opt.UseSqlServer(connectionString));
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


			services.AddScoped<IUnitOfWork, UnitOfWork>();
			services.AddScoped<IDbContext, DulcesYmasContext>();

			services.AddControllersWithViews()
				 .AddNewtonsoftJson(options =>
	options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore
);
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

		public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			if (env.IsDevelopment())
			{
				app.UseDeveloperExceptionPage();
			}
			else
			{
				app.UseExceptionHandler("/Error");
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
					options.SwaggerEndpoint("/swagger/v1/swagger.json", "Signus Presupuesto v1");
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

				spa.Options.SourcePath = "ClientApp";

				if (env.IsDevelopment())
				{
					spa.UseAngularCliServer(npmScript: "start");
				}
			});
		}
	}
}
