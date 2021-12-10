
namespace LibrarySystem
{
    partial class AdminForm
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
            this.DirEditor = new System.Windows.Forms.Button();
            this.Reports = new System.Windows.Forms.Button();
            this.InputFromView = new System.Windows.Forms.Button();
            this.findFormBut = new System.Windows.Forms.Button();
            this.dFormBut = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // DirEditor
            // 
            this.DirEditor.Location = new System.Drawing.Point(123, 22);
            this.DirEditor.Name = "DirEditor";
            this.DirEditor.Size = new System.Drawing.Size(195, 56);
            this.DirEditor.TabIndex = 0;
            this.DirEditor.Text = "Редактор справочников";
            this.DirEditor.UseVisualStyleBackColor = true;
            this.DirEditor.Click += new System.EventHandler(this.DirEditor_Click);
            // 
            // Reports
            // 
            this.Reports.Location = new System.Drawing.Point(123, 84);
            this.Reports.Name = "Reports";
            this.Reports.Size = new System.Drawing.Size(195, 55);
            this.Reports.TabIndex = 2;
            this.Reports.Text = "Посмотреть отчеты";
            this.Reports.UseVisualStyleBackColor = true;
            this.Reports.Click += new System.EventHandler(this.Reports_Click);
            // 
            // InputFromView
            // 
            this.InputFromView.Location = new System.Drawing.Point(123, 145);
            this.InputFromView.Name = "InputFromView";
            this.InputFromView.Size = new System.Drawing.Size(193, 55);
            this.InputFromView.TabIndex = 3;
            this.InputFromView.Text = "Ввод данных через представление";
            this.InputFromView.UseVisualStyleBackColor = true;
            this.InputFromView.Click += new System.EventHandler(this.InputFromView_Click);
            // 
            // findFormBut
            // 
            this.findFormBut.Location = new System.Drawing.Point(123, 206);
            this.findFormBut.Name = "findFormBut";
            this.findFormBut.Size = new System.Drawing.Size(193, 55);
            this.findFormBut.TabIndex = 4;
            this.findFormBut.Text = "Поисковая форма";
            this.findFormBut.UseVisualStyleBackColor = true;
            this.findFormBut.Click += new System.EventHandler(this.findFormBut_Click);
            // 
            // dFormBut
            // 
            this.dFormBut.Location = new System.Drawing.Point(123, 267);
            this.dFormBut.Name = "dFormBut";
            this.dFormBut.Size = new System.Drawing.Size(193, 55);
            this.dFormBut.TabIndex = 5;
            this.dFormBut.Text = "Сложная форма";
            this.dFormBut.UseVisualStyleBackColor = true;
            this.dFormBut.Click += new System.EventHandler(this.dFormBut_Click);
            // 
            // AdminForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(454, 363);
            this.Controls.Add(this.dFormBut);
            this.Controls.Add(this.findFormBut);
            this.Controls.Add(this.InputFromView);
            this.Controls.Add(this.Reports);
            this.Controls.Add(this.DirEditor);
            this.Name = "AdminForm";
            this.Text = "Окно администратора";
            this.Load += new System.EventHandler(this.AdminForm_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button DirEditor;
        private System.Windows.Forms.Button Reports;
        private System.Windows.Forms.Button InputFromView;
        private System.Windows.Forms.Button findFormBut;
        private System.Windows.Forms.Button dFormBut;
    }
}