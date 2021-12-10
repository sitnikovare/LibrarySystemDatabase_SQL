
namespace LibrarySystem
{
    partial class InputFromView
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
            this.showTableRich = new System.Windows.Forms.RichTextBox();
            this.InputAuthorName = new System.Windows.Forms.TextBox();
            this.authorNameLabel = new System.Windows.Forms.Label();
            this.InputInTable = new System.Windows.Forms.Button();
            this.noteRTB = new System.Windows.Forms.RichTextBox();
            this.SuspendLayout();
            // 
            // showTableRich
            // 
            this.showTableRich.Location = new System.Drawing.Point(302, 38);
            this.showTableRich.Name = "showTableRich";
            this.showTableRich.ReadOnly = true;
            this.showTableRich.Size = new System.Drawing.Size(316, 255);
            this.showTableRich.TabIndex = 0;
            this.showTableRich.Text = "";
            // 
            // InputAuthorName
            // 
            this.InputAuthorName.Location = new System.Drawing.Point(44, 58);
            this.InputAuthorName.Name = "InputAuthorName";
            this.InputAuthorName.Size = new System.Drawing.Size(214, 22);
            this.InputAuthorName.TabIndex = 1;
            // 
            // authorNameLabel
            // 
            this.authorNameLabel.AutoSize = true;
            this.authorNameLabel.Location = new System.Drawing.Point(41, 38);
            this.authorNameLabel.Name = "authorNameLabel";
            this.authorNameLabel.Size = new System.Drawing.Size(89, 17);
            this.authorNameLabel.TabIndex = 2;
            this.authorNameLabel.Text = "Имя автора:";
            // 
            // InputInTable
            // 
            this.InputInTable.Location = new System.Drawing.Point(66, 86);
            this.InputInTable.Name = "InputInTable";
            this.InputInTable.Size = new System.Drawing.Size(168, 58);
            this.InputInTable.TabIndex = 3;
            this.InputInTable.Text = "Ввести значение в таблицу";
            this.InputInTable.UseVisualStyleBackColor = true;
            this.InputInTable.Click += new System.EventHandler(this.InputInTable_Click);
            // 
            // noteRTB
            // 
            this.noteRTB.BackColor = System.Drawing.SystemColors.Info;
            this.noteRTB.Enabled = false;
            this.noteRTB.Location = new System.Drawing.Point(31, 209);
            this.noteRTB.Name = "noteRTB";
            this.noteRTB.ReadOnly = true;
            this.noteRTB.Size = new System.Drawing.Size(244, 59);
            this.noteRTB.TabIndex = 4;
            this.noteRTB.Text = "Примечание: представление работает с авторами с фамилией на Д.";
            // 
            // InputFromView
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(658, 347);
            this.Controls.Add(this.noteRTB);
            this.Controls.Add(this.InputInTable);
            this.Controls.Add(this.authorNameLabel);
            this.Controls.Add(this.InputAuthorName);
            this.Controls.Add(this.showTableRich);
            this.Name = "InputFromView";
            this.Text = "Ввод через представление";
            this.Load += new System.EventHandler(this.InputFromView_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RichTextBox showTableRich;
        private System.Windows.Forms.TextBox InputAuthorName;
        private System.Windows.Forms.Label authorNameLabel;
        private System.Windows.Forms.Button InputInTable;
        private System.Windows.Forms.RichTextBox noteRTB;
    }
}