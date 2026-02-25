Custom Vehicle Spawner Template, by rouennes



1️⃣ Creating a Custom Vehicle

To spawn a custom vehicle, you first need to create or duplicate a vehicle script. In this mod, we use a Van as an example (based on Base.VanOldMill).
All vanilla vehicle scripts can be found here: Steam\steamapps\common\ProjectZomboid\media\scripts\generated\vehicles

Copy the vehicle script you want to customize into your mod, keeping the same folder structure:
YourModName\42\media\scripts\generated\vehicles
In the copied script, simply change the vehicle name:
module Base
{
    vehicle Template

By renaming Template, you create a brand-new independent vehicle that can be freely modified without overriding vanilla vehicles.



2️⃣ Adding a Custom Skin

Vanilla vehicle textures are located here: Steam\steamapps\common\ProjectZomboid\media\textures\Vehicles
Select the texture matching your vehicle, edit it, and save your custom version inside your mod:
YourModName\42\media\textures\Vehicles

Then add this to your vehicle script:
skin
{
    texture = Vehicles/vehicle_templateskin,
}

⚠ Make sure the PNG filename exactly matches the name used in the script.



3️⃣ Spawning a Vanilla Vehicle

If you simply want to spawn a vanilla vehicle, use its original script without changing its name or skin.



4️⃣ Configuring Vehicle Spawn

To configure vehicle spawning, open: YourModName\42\media\lua\server\VehicleSpawner.lua This file is already commented to guide you.
You will need to:
Define a unique identifier (prevents multiplayer desync) ;
Set the correct vehicle name (Base.YourVehicleName) ;
Enter precise coordinates ;
Configure vehicle orientation (Yaw) :

Yaw reference:
0 = facing North
90 = facing East
180 = facing South
270 = facing West

⚠ This template does not support indoor vehicle spawning.

You can add as many vehicles as needed.

This template can easily be integrated into your own custom map mod.
