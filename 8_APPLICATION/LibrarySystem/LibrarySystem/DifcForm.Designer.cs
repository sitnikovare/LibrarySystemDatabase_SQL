
namespace LibrarySystem
{
    partial class DifcForm
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
            this.readers = new System.Windows.Forms.RichTextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.readerid = new System.Windows.Forms.TextBox();
            this.findRows = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.outResult = new System.Windows.Forms.RichTextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // readers
            // 
            this.readers.Location = new System.Drawing.Point(12, 51);
            this.readers.Name = "readers";
            this.readers.ReadOnly = true;
            this.readers.Size = new System.Drawing.Size(614, 327);
            this.readers.TabIndex = 0;
            this.readers.Text = "";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 381);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(446, 17);
            this.label1.TabIndex = 1;
            this.label1.Text = "Введите ID читателя, чтобы увидеть все связанные с ним записи:";
            // 
            // readerid
            // 
            this.readerid.Location = new System.Drawing.Point(74, 406);
            this.readerid.Name = "readerid";
            this.readerid.Size = new System.Drawing.Size(94, 22);
            this.readerid.TabIndex = 2;
            // 
            // findRows
            // 
            this.findRows.Location = new System.Drawing.Point(184, 401);
            this.findRows.Name = "findRows";
            this.findRows.Size = new System.Drawing.Size(113, 27);
            this.findRows.TabIndex = 3;
            this.findRows.Text = "Найти";
            this.findRows.UseVisualStyleBackColor = true;
            this.findRows.Click += new System.EventHandler(this.findRows_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(32, 26);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(215, 17);
            this.label2.TabIndex = 4;
            this.label2.Text = "Список читателей библиотеки:";
            // 
            // outResult
            // 
            this.outResult.Location = new System.Drawing.Point(655, 51);
            this.outResult.Name = "outResult";
            this.outResult.ReadOnly = true;
            this.outResult.Size = new System.Drawing.Size(858, 377);
            this.outResult.TabIndex = 5;
            this.outResult.Text = "";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(661, 26);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(80, 17);
            this.label3.TabIndex = 6;
            this.label3.Text = "Результат:";
            // 
            // DifcForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1536, 449);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.outResult);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.findRows);
            this.Controls.Add(this.readerid);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.readers);
            this.Name = "DifcForm";
            this.Text = "Сложная форма";
            this.Load += new System.EventHandler(this.DifcForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RichTextBox readers;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox readerid;
        private System.Windows.Forms.Button findRows;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.RichTextBox outResult;
        private System.Windows.Forms.Label label3;
    }
}