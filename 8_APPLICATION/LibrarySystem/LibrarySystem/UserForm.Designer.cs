
namespace LibrarySystem
{
    partial class UserForm
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
            this.ShowDirs = new System.Windows.Forms.Button();
            this.Reports = new System.Windows.Forms.Button();
            this.findFormBut = new System.Windows.Forms.Button();
            this.dFormBut = new System.Windows.Forms.Button();
            this.InputFromView = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ShowDirs
            // 
            this.ShowDirs.Location = new System.Drawing.Point(113, 31);
            this.ShowDirs.Name = "ShowDirs";
            this.ShowDirs.Size = new System.Drawing.Size(193, 55);
            this.ShowDirs.TabIndex = 0;
            this.ShowDirs.Text = "Посмотреть справочники";
            this.ShowDirs.UseVisualStyleBackColor = true;
            this.ShowDirs.Click += new System.EventHandler(this.ShowDirs_Click);
            // 
            // Reports
            // 
            this.Reports.Location = new System.Drawing.Point(113, 92);
            this.Reports.Name = "Reports";
            this.Reports.Size = new System.Drawing.Size(193, 55);
            this.Reports.TabIndex = 1;
            this.Reports.Text = "Посмотреть отчеты";
            this.Reports.UseVisualStyleBackColor = true;
            this.Reports.Click += new System.EventHandler(this.Reports_Click);
            // 
            // findFormBut
            // 
            this.findFormBut.Location = new System.Drawing.Point(113, 153);
            this.findFormBut.Name = "findFormBut";
            this.findFormBut.Size = new System.Drawing.Size(193, 55);
            this.findFormBut.TabIndex = 2;
            this.findFormBut.Text = "Поисковая форма";
            this.findFormBut.UseVisualStyleBackColor = true;
            this.findFormBut.Click += new System.EventHandler(this.findFormBut_Click);
            // 
            // dFormBut
            // 
            this.dFormBut.Location = new System.Drawing.Point(113, 214);
            this.dFormBut.Name = "dFormBut";
            this.dFormBut.Size = new System.Drawing.Size(193, 55);
            this.dFormBut.TabIndex = 3;
            this.dFormBut.Text = "Сложная форма";
            this.dFormBut.UseVisualStyleBackColor = true;
            this.dFormBut.Click += new System.EventHandler(this.dFormBut_Click);
            // 
            // InputFromView
            // 
            this.InputFromView.Location = new System.Drawing.Point(113, 275);
            this.InputFromView.Name = "InputFromView";
            this.InputFromView.Size = new System.Drawing.Size(193, 55);
            this.InputFromView.TabIndex = 4;
            this.InputFromView.Text = "Ввод данных через представление";
            this.InputFromView.UseVisualStyleBackColor = true;
            this.InputFromView.Click += new System.EventHandler(this.InputFromView_Click);
            // 
            // UserForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(415, 367);
            this.Controls.Add(this.InputFromView);
            this.Controls.Add(this.dFormBut);
            this.Controls.Add(this.findFormBut);
            this.Controls.Add(this.Reports);
            this.Controls.Add(this.ShowDirs);
            this.Name = "UserForm";
            this.Text = "Окно пользователя";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button ShowDirs;
        private System.Windows.Forms.Button Reports;
        private System.Windows.Forms.Button findFormBut;
        private System.Windows.Forms.Button dFormBut;
        private System.Windows.Forms.Button InputFromView;
    }
}