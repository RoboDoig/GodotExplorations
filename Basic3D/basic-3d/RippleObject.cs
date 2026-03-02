using Godot;

public partial class RippleObject : MeshInstance3D
{
    ShaderMaterial material;
    public override void _Ready()
    {
        base._Ready();

        material = (ShaderMaterial)GetSurfaceOverrideMaterial(0);

        GD.Print(material);
    }

    public override void _Process(double delta)
    {
        base._Process(delta);

        if (Input.IsActionJustPressed("ButtonInput"))
        {
            material.SetShaderParameter("wave_height", GD.RandRange(0.0, 1.0));
        }
    }
}
