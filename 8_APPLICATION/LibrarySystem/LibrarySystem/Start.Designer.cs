
namespace LibrarySystem
{
    partial class Start
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.EnterAsUser = new System.Windows.Forms.Button();
            this.EnterAsAdmin = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // EnterAsUser
            // 
            this.EnterAsUser.Location = new System.Drawing.Point(134, 89);
            this.EnterAsUser.Name = "EnterAsUser";
            this.EnterAsUser.Size = new System.Drawing.Size(146, 53);
            this.EnterAsUser.TabIndex = 1;
            this.EnterAsUser.Text = "Пользователь";
            this.EnterAsUser.UseVisualStyleBackColor = true;
            this.EnterAsUser.Click += new System.EventHandler(this.EnterAsUser_Click);
            // 
            // EnterAsAdmin
            // 
            this.EnterAsAdmin.Location = new System.Drawing.Point(134, 148);
            this.EnterAsAdmin.Name = "EnterAsAdmin";
            this.EnterAsAdmin.Size = new System.Drawing.Size(145, 53);
            this.EnterAsAdmin.TabIndex = 2;
            this.EnterAsAdmin.Text = "Администратор";
            this.EnterAsAdmin.UseVisualStyleBackColor = true;
            this.EnterAsAdmin.Click += new System.EventHandler(this.EnterAsAdmin_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(170, 52);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(78, 17);
            this.label1.TabIndex = 3;
            this.label1.Text = "Войти как:";
            // 
            // Start
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(421, 270);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.EnterAsAdmin);
            this.Controls.Add(this.EnterAsUser);
            this.Name = "Start";
            this.Text = "Вход в систему";
            this.Load += new System.EventHandler(this.Start_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button EnterAsUser;
        private System.Windows.Forms.Button EnterAsAdmin;
        private System.Windows.Forms.Label label1;
    }
}