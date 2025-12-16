using Microsoft.EntityFrameworkCore;
using MvcDevConnect.Contexts;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext<DevConnectContext>(Options =>
Options.UseSqlServer(builder.Configuration.GetConnectionString("DevCon_SA"))
);

// 1️⃣ Registrar serviços ANTES do Build()
builder.Services.AddControllersWithViews();

// builder.Services.AddDbContext<db_Devconnect_TContext>(options =>
//     options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// 2️⃣ Agora pode buildar
var app = builder.Build();

// 3️⃣ Pipeline
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();

