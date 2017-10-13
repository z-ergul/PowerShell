# PowerShell
Windows PowerShell, Net framework altyapısında, Windows işletim üzerinde local olarak yada diğer bir işletim sistemine uzaktan konfigürasyonlar gerçekleştirmek için gerekli olan CIM(Common Information Model) ve WMI(Windows Management Instrumentation) denetimlerini tam yetki ile kullanılmasını sağlar. Böylece cmd.exe yerine çok daha etkili ve fonksiyonel kullanıma sahip bir yazılım veya scripting altyapına sahip olunur.
Powershell'in sahip olduğu komutlara Cmdlet denir.Uygun komutlar girildiğinde sistemler ilgili istenilen bilgiler elde edilebilir.
Scriptimizdeki bazı komutları çalıştırabilmek için PowerShell terminalimizde "import ActiveDirectory" komutu ile Active Directory modülümüzü eklememiz gerekmektedir.
Active Directory, veritabanında ağ objeleri hakkındaki bilgileri saklar. Bu Active Directory objeleri başta kullanıcılar, gruplar, bilgisayarlar ve yazıcılar olmak üzere ağ kaynaklarını temsil etmektedir.
Active Directory ile çalışan komutlar;
Get-ADDomain --> Domain bilgilerini verir.
Get-ADGroup --> Grup bilgilerini elde ederiz.
Get-ADDomainController --> Domain controller bilgilerini elde ederiz.

Geriye kalan komutlarımız bu modül olmadanda çalışır.

$user_name = (Get-Item env:\username).Value --> Bilgisayarda o an hangi kullanıcı adıyla giriş yaptığınızın bilgisini elde edersiniz.   
$computer_name = (Get-Item env:\Computername).Value  --> Bilgisayarın adını elde edersiniz.
gwmi Win32_NetworkAdapterConfiguration -computername $computer_name | Select IPAddress,DefaultIPGateway --> Cihazın ip adresi, mac adresi ve default gateway adres bilgisini elde ederiz.
netstat -ano --> Cihazdaki açık bağlantıları listeler.
schtasks --> Bilgisayardaki planlı işlemleri (zamanlanmış görevleri) listeler.
get-service | where-object {$_.Status -eq "Running"} | Select-Object Name --> Çalışan servisleri listeler.
gwmi -computer $computer_name Win32_UserAccount | foreach {$_.Name} --> Bilgisayarda kayıtlı olan kullanıcı isimlerini listeler
gwmi Win32_processor | Select  Name,ProcessId --> İşlemci adı ve process id'sini elde ederiz.
gwmi -computer $computer_name Win32_ComputerSystem | Format-List Name,Domain,Manufacturer,Model,SystemType --> İşletim sisteminde çalışan bilgisayaların isimleri,dahil olduğu domain,model bilgisi,üreticisinin adı, sistem tipi gibi bilgileri verir
gwmi -computer $computer_name Win32_OperatingSystem | Format-List @{Expression={$_.Caption};Label="OS Name"},SerialNumber,OSArchitecture --> İşletim sisteminin seri numarası, adı ve mimarisi ile ilgili bilgileri elde ederiz.
    
   

