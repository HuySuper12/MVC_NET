using BookManagement.Application;
using BookManagement.Domain;
using BookManagement.Domain.Entities;
using BookManagement.Infrastructure;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace BookManagement.Views
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddRazorPages();

            //Cookie identity
            builder.Services.ConfigureApplicationCookie(options =>
            {
                options.Cookie.HttpOnly = true;
                options.Cookie.SecurePolicy = CookieSecurePolicy.Always;    // Chỉ dùng cookie khi có HTTPS
                options.Cookie.SameSite = SameSiteMode.Lax;                 // hoặc Strict nếu bạn muốn hạn chế gửi cookie
                options.LoginPath = "/Login";
                options.AccessDeniedPath = "/AccessDenied";
                options.SlidingExpiration = true;                           // Gia hạn cookie khi người dùng hoạt động
                options.ExpireTimeSpan = TimeSpan.FromMinutes(60);          // Cookie sẽ hết hạn sau 60 phút
            });
            builder.Services.AddAuthorization();                            // Thêm dịch vụ Authorization - chung vs Cookie

            // Cấu hình Session
            builder.Services.AddDistributedMemoryCache();                   
            builder.Services.AddSession(options =>
            {
                options.IdleTimeout = TimeSpan.FromMinutes(60);             // Session sẽ hết hạn sau 60 phút không hoạt động
                options.Cookie.HttpOnly = true;                             // Bảo mật session
                options.Cookie.IsEssential = true;                          // Đảm bảo session hoạt động ngay cả khi người dùng không đồng ý cookie
            });
            builder.Services.AddHttpContextAccessor();                      // Để inject HttpContext nếu cần

            // Cấu hình Google Authentication
            builder.Services.AddAuthentication(options =>
            {
                options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
                options.DefaultChallengeScheme = GoogleDefaults.AuthenticationScheme;
            })
            .AddCookie()
            .AddGoogle(googleOptions =>
            {
                googleOptions.ClientId = builder.Configuration["Authentication:Google:ClientId"];
                googleOptions.ClientSecret = builder.Configuration["Authentication:Google:ClientSecret"];
            });
            builder.Services.AddAuthorization();                            // Thêm dịch vụ Authorization - chung vs Cookie

            // Add Identity
            builder.Services.AddIdentity<UserAccount, IdentityRole>()
    .AddEntityFrameworkStores<BookManagementDbContext>()
    .AddDefaultTokenProviders();

            // Add DbContext Dependency Injection
            builder.Services.AddDbContext<BookManagementDbContext>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

            //Dependency Injection - Repository and Service
            builder.Services.AddScoped<IBookRepository, BookRepository>();
            builder.Services.AddScoped<IBookService, BookService>();

            builder.Services.AddScoped<IBookCategoryRepository, BookCategoryRepository>();
            builder.Services.AddScoped<IBookCategoryService, BookCategoryService>();

            builder.Services.AddScoped<IUserAccountRepository, UserAccountRepository>();
            builder.Services.AddScoped<IUserAccountService, UserAccountService>();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            // Kích hoạt Session middleware
            app.UseSession();

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            //4 use nay dung cho Cookie Identity
            app.UseRouting();
            app.UseAuthentication();                                        // Bắt buộc nếu dùng xác thực (Identity/Cookie)
            app.UseAuthorization();                                         // Bắt buộc nếu dùng [Authorize]
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });

            app.MapRazorPages();

            app.Run();
        }
    }
}
